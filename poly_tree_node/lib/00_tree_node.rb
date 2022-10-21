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

    # def inspect
    #     # children -> children values
    #     { "children" => @children, "parent" => @parent, "value" => @value }.inspect
    # end

    # private

    
end