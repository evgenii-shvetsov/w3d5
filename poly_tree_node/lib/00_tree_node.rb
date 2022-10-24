class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    # def children=(value)
    #     @children = value
    # end

    # n3.parent = n2
    def parent=(node)
        # @parent.children -= [self] unless @parent.nil?
        if !node.nil?
            @parent.children.select! { |el| el != self } if !@parent.nil?
            node.children << self if !node.children.include? self    
        end
        @parent = node
        # nil
    end

    def add_child(child_node)
        # @parent.children= child_node
        child_node.parent= self
        if !self.children.include?(child_node)
            self.children << child_node
        end
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "node is not a child"
        end

        self.children.select! {|el| el != child_node}
        child_node.parent = nil
        
    end

    def dfs(target)
        # return target if you find it
        # return nil if self.children is empty
        return self if self.value == target
        # return nil if self.children.empty?
        self.children.each do |child| 
            # return nil if self.children.empty?
            res = child.dfs(target)
            return res unless res.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
          first = queue.shift  
          return first if first.value == target
            queue.push(*first.children)
        end
        nil

    end

    # def inspect
    #     # children -> children values
    #     # { "value" => @value }.inspect
    # end

    # private

end