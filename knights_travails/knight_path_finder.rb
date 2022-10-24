require "../poly_tree_node/lib/00_tree_node.rb"
require 'byebug'
class KnightPathFinder
    attr_reader :root_node, :considered_positions
    def self.valid_moves(pos)
        possible_positions = []
        possible_positions << [pos[0] + 2, pos[1] + 1] << [pos[0] + 2, pos[1] - 1]
        possible_positions << [pos[0] + 1, pos[1] + 2] << [pos[0] + 1, pos[1] - 2]
        possible_positions << [pos[0] - 1, pos[1] - 2] << [pos[0] - 1, pos[1] + 2]
        possible_positions << [pos[0] - 2, pos[1] - 1] << [pos[0] - 2, pos[1] + 1]
        possible_positions.select {|el| !(el[0] < 0) && !(el[0]>7) && !(el[1]<0) && !(el[1]>7)}
    end

    def initialize(position)
        @start_pos = position
        @considered_positions = [position]
        # debugger
        self.build_move_tree
    end

    def new_move_positions(pos)
        valid_positions = KnightPathFinder.valid_moves(pos)
        res = valid_positions.select {|pos| !@considered_positions.include?(pos) }
        @considered_positions += res
        res
    end

    def build_move_tree
        # debugger
        @root_node = PolyTreeNode.new(@start_pos)
        queue = [root_node]
        until queue.empty? #while it's not empty
            temp = queue.shift
            new_move_positions(temp.value).each do |pos|
                node = PolyTreeNode.new(pos)
                temp.add_child(node)
                queue << node
            end
        end
        # node
    end

    def find_path(target)
        target_node = root_node.dfs(target)
        path = trace_path_back(target_node)
        [root_node.value] + path.reverse
    end

    def trace_path_back(node)
        new_arr = []
        until node.parent.nil?
            new_arr << node.value
            node = node.parent
        end
        new_arr
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([6, 2])

