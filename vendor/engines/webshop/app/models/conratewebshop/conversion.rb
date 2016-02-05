module Conratewebshop
  class Conversion < ActiveRecord::Base
    validates :from_id, presence: true
    validates :to_id, presence: true

    has_one :from, foreign_key: :from_id, class_name: "QuantityUnit"
    has_one :to, foreign_key: :from_id, class_name: "QuantityUnit"

    def self.convert(from_id, to_id, quantity)
      elements = Conratewebshop::Conversion.all.map{ |c| [c.from_id, c.to_id, 1] }
      g = Conratewebshop::Graph.new(elements)
      path, weight = g.shortest_path(from_id, to_id)
      res = quantity
      path.each_cons(2){ |p, nxt|
        q = Conratewebshop::Conversion.where(from_id: p, to_id: nxt).try(:first).try(:quantity)
        if q.nil?
          q = 1/Conratewebshop::Conversion.where(from_id: nxt, to_id: p).try(:first).try(:quantity)
        end
        res = res * q
      }
      return res
    end
  end

  class Graph
    Vertex = Struct.new(:name, :neighbours, :dist, :prev)

    def initialize(graph)
      @vertices = Hash.new{|h,k| h[k]=Vertex.new(k,[],Float::INFINITY)}
      @edges = {}
      graph.each do |(v1, v2, dist)|
        @vertices[v1].neighbours << v2
        @vertices[v2].neighbours << v1
        @edges[[v1, v2]] = @edges[[v2, v1]] = dist
      end
      @dijkstra_source = nil
    end

    def dijkstra(source)
      return  if @dijkstra_source == source
      q = @vertices.values
      q.each do |v|
        v.dist = Float::INFINITY
        v.prev = nil
      end
      @vertices[source].dist = 0
      until q.empty?
        u = q.min_by {|vertex| vertex.dist}
        break if u.dist == Float::INFINITY
        q.delete(u)
        u.neighbours.each do |v|
          vv = @vertices[v]
          if q.include?(vv)
            alt = u.dist + @edges[[u.name, v]]
            if alt < vv.dist
              vv.dist = alt
              vv.prev = u.name
            end
          end
        end
      end
      @dijkstra_source = source
    end

    def shortest_path(source, target)
      dijkstra(source)
      path = []
      u = target
      while u
        path.unshift(u)
        u = @vertices[u].prev
      end
      return path, @vertices[target].dist
    end

    def to_s
      "#<%s vertices=%p edges=%p>" % [self.class.name, @vertices.values, @edges]
    end
  end
end
