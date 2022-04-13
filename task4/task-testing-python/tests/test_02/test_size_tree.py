from tree_utils_02 import size_node, size_tree, node, tree
import pytest
import os
def test_add():
    #file_1 = size_node.FileSizeNode('mama', False, [], os.path.getsize('mama'))
    file_1 = tree.Tree()
    file_node_1 = file_1.construct_filenode('mama', True)
    assert file_node_1 == file_1.update_filenode(file_node_1)

    file = tree.Tree()
    doughter_file_node = node.FileNode('doughter', True, [])
    file_node_1 = file_1.construct_filenode('mama', False)
    assert None == file.filter_empty_nodes(file_node_1)

    with pytest.raises(AttributeError):
        file.get('sister', True)
    file_node = node.FileNode('mama', True, [doughter_file_node])
    assert None == file.filter_empty_nodes(file_node)

    assert file_1.construct_filenode('text1.txt', False) == file.get('text1.txt', False)
    assert None == file.get('text1.txt', True, True)

    with pytest.raises(AttributeError):
        file.get(file.get('text1.txt', True, False))

    child1 = node.FileNode('mama/doughter', True, [])
    child2 = node.FileNode('mama/sun', True, [])
    assert node.FileNode('mama', True, [child1, child2]) != file.get('mama', True, True)
