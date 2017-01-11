def bubble_sort(arr)
    times = arr.length-1
    puts times
    times.times do
        arr.each_with_index do |ele, index|
            if(index == times)
                next
            elsif(arr[index] > arr[index+1])
                arr[index], arr[index+1] = arr[index+1], arr[index]
            end
        end
    end
    return arr
end

def bubble_sort_by(arr, &comp)
    times = arr.length-1
    times.times do
        arr.each_with_index do |ele, index|
            a = arr[index]
            b = arr[index+1]
            if(index == times)
                next
            elsif(yield(a,b) == 1)
                arr[index], arr[index+1] = arr[index+1], arr[index]
            end
        end
    end
    return arr
end

sort_comp = Proc.new do |a,b|
    a <=> b
end



    

my_arr = [-4,8,24,3,15,-5,48,11,63,75,-18,-4]
p bubble_sort(my_arr)
my_arr = [-14,28,24,-3,15,-25,41,11,63,5,-18,-4]
p bubble_sort_by(my_arr, &sort_comp)