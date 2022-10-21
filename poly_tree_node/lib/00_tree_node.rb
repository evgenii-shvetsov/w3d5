class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :parent


    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end


    # private

    
end