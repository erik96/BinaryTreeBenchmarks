#include <iostream>
#include <string>
#include <sstream>
#include <fstream>

/**
    Following namespace is a workaround for a bug in MinGW which misses the to_string function.
*/
namespace patch
{
    template < typename T > std::string to_string( const T& n )
    {
        std::ostringstream stm ;
        stm << n ;
        return stm.str() ;
    }
}

using namespace std;

class Node {
public:
    int value;
    Node *left = NULL;
    Node *right = NULL;
};

class Tree {
private:
    Node *root;
    string output = "";

public:
    Tree() {
        this->root = NULL;
    }
    Tree(Node *root) {
        this->root = root;
    }

    Node *insert(Node *root, int v) {
        if (root == NULL) {
            root = new Node();
            root->value = v;
        } else if (v < root->value) {
            root->left = insert(root->left, v);
        } else {
            root->right = insert(root->right, v);
        }

        return root;
    }

    void traverse(Node *root) {
        if (root == NULL) {
            return;
        }

        traverse(root->left);
        output = output + patch::to_string(root->value) + " ";
        traverse(root->right);
    }

    string getOutput() {
        return this->output;
    }

    void cleanup(Node *root) {
        output = "";
        if(root->left!=NULL)
            cleanup(root->left);
        if(root->right!=NULL)
            cleanup(root->right);
        delete root;
    }
};

int main()
{
    Node *root = NULL;
    Tree bst;

    // read
    ifstream f("in.txt");
    int x;
    while(f>>x) {
        root = bst.insert(root, x);
    }
    f.close();

    // operate
    bst.traverse(root);

    // write
    ofstream g("write.txt");
    g<<bst.getOutput()<<'\n';
    g.close();

    // cleanup
    bst.cleanup(root);
    root = NULL;

    return 0;
}
