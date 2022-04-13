from tree_utils_02 import size_node, size_tree, node, tree
import pytest
import os

def test_add():
    file_1 = size_node.FileSizeNode('mama', False, [], os.path.getsize('mama'))
    file_test_1 = size_tree.SizeTree()
    assert file_1 == file_test_1.construct_filenode('mama', False)

    file_2 = size_node.FileSizeNode('src', True, [file_1], 0)
    file_test_2 = size_tree.SizeTree()
    file_test_2.construct_filenode('src', True)

    assert file_2 == file_test_2.update_filenode(file_2)
