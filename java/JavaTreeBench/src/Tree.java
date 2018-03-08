/**
 * Created by erik on 3/8/18
 */
public class Tree {

    private Node root;
    private String output = "";

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
        output = output + Integer.toString(root.value) + " ";
        traverse(root.right);
    }

    public String getOutput()
    {
        return this.output;
    }
}
