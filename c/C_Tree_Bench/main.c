#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

typedef struct nod {
    int value;
    struct nod *left;
    struct nod *right;
}Node;

void insert(Node **root, int v) {
    Node *temp;
    if (*root == NULL) {
        temp = (Node *) malloc(sizeof(Node));
        temp->left = temp->right = NULL;
        temp->value = v;
        *root = temp;
    } else if (v < (*root)->value) {
        insert(&(*root)->left, v);
    } else {
        insert(&(*root)->right, v);
    }
}

void traverse(Node *root, FILE *out) {
    if (root == NULL) {
        return;
    }

    traverse(root->left, out);
    fprintf(out, "%d ", root->value);
    traverse(root->right, out);

}

void cleanup(Node *root) {
    if (root != NULL) {
        cleanup(root->left);
        cleanup(root->right);
        free(root);
    }
}

int main()
{
    Node *root = NULL;

    FILE *file = fopen("in.txt", "r");
    while (!feof(file)) {
        int i = 0;
        fscanf(file, "%d", &i);
        insert(&root, i);
    }
    fclose(file);

    FILE *outputFile = fopen("out.txt", "w");
    traverse(root, outputFile);
    fclose(outputFile);

    cleanup(root);
    return 0;
}
