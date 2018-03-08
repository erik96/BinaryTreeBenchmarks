import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by erik on 3/8/18
 */
public class Main {

    public static void main(String[] args) {

        Node root = null;
        Tree bst = new Tree();

        try {
            BufferedReader br = new BufferedReader(new FileReader("in.txt"));
            List<Integer> numbers = new ArrayList<Integer>();
            String line = null;

            while ((line = br.readLine()) != null) {
                String []strNumbers = line.split(" ");
                for(String strNumber : strNumbers){
                    numbers.add(Integer.parseInt(strNumber));
                }

                //System.out.println(line);
            }
            br.close();

            for (Integer i : numbers) {
                root = bst.insert(root, i);
            }

            bst.traverse(root);

            PrintWriter pw = new PrintWriter("write.txt");
            pw.println(bst.getOutput());
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
