// here i'm using js as my programming language 
// ===============================================

// 4. Consider a sequence: 0,1,1,2,3,5,8,13,21....
// Write an algorithm to find the nth number of the sequence above.
//==================================================================

// this is the fibonacci series => the next element = sum of precending two.

class Algorithm 
{
    static fib(n)
    {
        let arr = new Array()
        arr.push(0,1)
        for(let i = 2; i <= n; i++)
        {
            arr[i] = arr[i-1] + arr[i-2]
        }
        return arr
    }
    static bubblesort(arr)
    {
        let i,j,n
        n = arr.length
        for(i=0;i<n;i++)
        {
            for(j=0;j<n-i;j++){
                let temp
                //sorting
                if (arr[j]<arr[j+1]) {
                    temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        return arr
    }
}
console.log('fib:'+Algorithm.fib(5).toString())
// output: 0,1,1,2,3,5


// 5. Consider an array: numbers = [10,9,56,7,2,45,33,20]
// Rearrange the given array in descending order.
//=======================================================================

//for the sorting of array i'm going to use bubble sort technique

var arr = [10,9,56,7,2,45,33,20]
console.log('desc:'+Algorithm.bubblesort(arr).toString())
//output: 56,45,33,20,10,9,7,2
