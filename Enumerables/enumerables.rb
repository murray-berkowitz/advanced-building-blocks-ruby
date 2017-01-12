module Enumerable
    def my_each
        if block_given?    
            i = 0
            for i in i...self.size
                yield(self[i])
            end
        else
            enumerator = self.to_enum(:my_each)
            return enumerator
        end
    end
    
    def my_each_with_index
        if block_given?
            i = 0
            for i in i...self.size
                yield(self[i], i)
            end
        else
           enumerator = self.to_enum(:my_each_with_index)
           return enumerator
        end
    end
    
    def my_select
        if block_given?    
            new_arr = []
            self.my_each do |e|
                if(yield(e) == true)
                    new_arr << e
                end
            end
            return new_arr
        else
           enumerator = self.to_enum(:my_select)
           return enumerator
        end
    end
    
    def my_all?
        if block_given?
            self.my_each do |e|
                if(yield(e) == false)
                    return false
                end
            end
            return true
        else
            self.my_each do |e|
                if(e)
                    next
                else
                    return false
                end
            end
            return true
        end
    end
    
    def my_any?
        if block_given?
            self.my_each do |e|
               if(yield(e) == true)
                    return true
                end 
            end
            return false
        else
            self.my_each do |e|
                if(e)
                    return true
                end
            end
            return false
        end
    end
    
    def my_none?
        if block_given?    
            self.my_each do |e|
               if(yield(e) == true)
                    return false
                end 
            end
            return true
        else
            self.my_each do |e|
                if(e)
                    return false
                end
            end
            return true
        end
    end
    
    def my_count(arg = nil)
        tally = 0
        if block_given?
            self.my_each do |e|
                if(yield(e) == true)
                    tally += 1
                end
            end
        elsif(arg != nil)
            self.my_each do |e|
                if(e == arg)
                    tally += 1
                end
            end
        else
            tally += self.size
        end
        return tally
    end
    
    
    def my_map
        if block_given?
            new_arr = []
            self.my_each do |e|
                new_arr << yield(e)
            end
            return new_arr
        else
            enumerator = self.to_enum(:my_map)
            return enumerator
        end
    end
    
    def my_inject(a=nil, b = nil)
        result = a 
        if block_given? && b==nil
            self.my_each do |e|
                if(result == nil)
                    result = e
                    next
                end
                result = yield(result, e)
            end
        else
        end
        return result
    end
end


