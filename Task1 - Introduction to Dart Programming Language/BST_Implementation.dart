import 'dart:io';

void main(){
  
  print('enter the number of items : ');
  var num = int.parse(stdin.readLineSync());
  
  var tree =  BinarySearchTree();
  
  print('enter the numbers :');
  for (var i =0 ; i<num ;i++)
  {
    var x= int.parse(stdin.readLineSync());
    tree.insert(x);
  }
  print('the tree items:');
  tree.inorder();
}

class Node
{
  int key;
  Node left=null, right=null;
   Node(this.key);
}
class BinarySearchTree {
  Node root;

  BinarySearchTree() {
    root = null;
  }

  void insert(int key) {
    root = insertRec(root, key);
  }

  Node insertRec(Node root, int key) {
    if (root == null) {
      root = Node(key);
      return root;
    }
    if (key < root.key) {
      root.left = insertRec(root.left, key);
    }
    else if (key > root.key) {
      root.right = insertRec(root.right, key);
    }

    return root;
  }

  void inorder() {
    inorderRec(root);
  }

  void inorderRec(Node root) {
    if (root != null) {
      inorderRec(root.left);
      print(root.key);
      inorderRec(root.right);
    }
  }
}
