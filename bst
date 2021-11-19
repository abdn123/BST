#include<iostream>
using namespace std;

template<typename T>class Node {
public:
	T data;
	Node<T>* left;
	Node<T>* right;
		
	Node():data(NULL),left(NULL),right(NULL){}
	Node(T a):data(a),left(NULL),right(NULL){}
};

template<typename T>class BST {
public:
	Node<T>* root;
	BST():root(NULL){}
	Node<T>* insert(Node<T>* a, T x) {
		if (a == NULL) {
			a = new Node<T>(x);
		}

		if (a->data > x)
			a->left = insert(a->left, x);
		if (a->data < x)
			a -> right = insert(a->right, x);

		return a;
	}
	void preorder(Node<T>* x) {
		if (x != NULL) {
			cout << x->data << " ";
			preorder(x->left);
			preorder(x->right);
		}
	}

	void postorder(Node<T>* x) {
		if (x != NULL) {
			postorder(x->left);
			postorder(x->right);
			cout << x->data << " ";
		}
	}

	void inorder(Node<T>* x) {
		if (x != NULL) {
			inorder(x->left);
			cout << x->data << " ";
			inorder(x->right);
		}
	}

	bool search(Node<T>* root, T s) {
		if (root == NULL)
			return false;
		if (root->data == s)
			return true;
		
		if (root->data > s)
			return search(root->left, s);
		if (root->data < s)
			return search(root->right, s);
	}

	void del(Node<T>* root, int s) {

	}
};



int main() {
	BST<int> tree;
	
	tree.root = tree.insert(NULL, 5);
	tree.insert(tree.root, 20);
	tree.insert(tree.root, 15);
	tree.insert(tree.root, 7);
	tree.insert(tree.root, 1);
	tree.insert(tree.root, 3);
	tree.insert(tree.root, 6);
	tree.insert(tree.root, 4);

	tree.preorder(tree.root);
	cout << endl;
	tree.postorder(tree.root);
	cout << endl;
	tree.inorder(tree.root);
	cout << endl;
	if (tree.search(tree.root, 7))
		cout << "FOUND!" << endl;
	else
		cout << "NOT FOUND!" << endl;
}
