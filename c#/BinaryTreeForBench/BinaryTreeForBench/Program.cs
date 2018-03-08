using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BinaryTreeForBench
{

    class Node
    {
        public int value;
        public Node left;
        public Node right;
    }

    class Tree
    {
        private Node root;
        private string output = "";
 
        public Tree()
        {
            this.root = null;
        }

        public Tree(Node root)
        {
            this.root = root;
        }

        public Node insert(Node root, int v)
        {
            if (root == null)
            {
                root = new Node();
                root.value = v;
            }
            else if (v < root.value)
            {
                root.left = insert(root.left, v);
            }
            else
            {
                root.right = insert(root.right, v);
            }

            return root;
        }

        public void traverse(Node root)
        {
            if (root == null)
            {
                return;
            }

            traverse(root.left);
            //Console.WriteLine(root.value);
            output = output + root.value + " ";
            traverse(root.right);
        }

        public string getOutput()
        {
            return this.output;
        }

        //todo: Method to clear output
    }
    class Program
    {
        static void Main(string[] args)
        {
            Node root = null;
            Tree bst = new Tree();

            using (StreamReader file = new StreamReader("in.txt"))
            {
                string[] numbers = file.ReadLine().Split(new char[] { ' ' },
                                       StringSplitOptions.RemoveEmptyEntries);

                foreach (string s in numbers)
                {
                    root = bst.insert(root, int.Parse(s));
                }
            }

            bst.traverse(root);

            using (StreamWriter writetext = new StreamWriter("write.txt"))
            {
                writetext.WriteLine(bst.getOutput());
            }
        }
    }
}
