def fibs(num)
    return [0] if num == 0
    return [0, 1] if num == 1

    arr = [0,1]
    for i in 2..(num) do
        arr[i] = arr[i-1] + arr[i-2]
    end
    arr
end
print 'Uisng iteration : '
puts fibs(14).join(', ')

def fib_rec(num)
    return [0] if num == 0
    return [0, 1] if num == 1

    array = fib_rec(num-1)
    array.push(array[-2] + array[-1])
end


print "\nUsing recursion : "
puts fib_rec(14).join(', ')