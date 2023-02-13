package Bilet15;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Main {
    public static void main(String[] args) {
        var stack = new Stack<Double>();
        for (var element : new Double[] {1.0, -2.0, 3.0, -4.0, 5.0, -6.0}) {
            stack.push(element);
        }

        System.out.println(stack);
        splitStack(stack);
        System.out.println(stack);
    }

    public static void splitStack(Stack<Double> stack){
        if (stack.empty()) return;

        Queue<Double> queue = new LinkedList<>();

        while(!stack.isEmpty()){
            queue.add(stack.pop());
        }

        var queueSize = queue.size();

        for(int i = 0; i < queueSize; i++){
            var element = queue.poll();
            if (element < 0) stack.push(element);
            else {
                queue.add(element);
                i++;
            }
        }

        while(!queue.isEmpty()) stack.push(queue.poll());
    }
}
