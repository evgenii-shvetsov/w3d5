class PolyTreeNode
    attr_reader :parent, :children, :value


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




    # def inspect
    #     # children -> children values
    #     { "children" => @children, "parent" => @parent, "value" => @value }.inspect
    # end

    # private

    
end