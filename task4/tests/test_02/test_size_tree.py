import shutil

from tree_utils_02 import size_node, size_tree, node, tree
import pytest, tempfile, contextlib, shutil
import os

@contextlib.contextmanager
def make_temp_directory():
    temp_dir = tempfile.mkdtemp()
    try:
        yield temp_dir
    finally:
        shutil.rmtree(temp_dir)


def test_add():
    with make_temp_directory() as temp_dir:
        file = tree.Tree()
        file_node_1 = file.construct_filenode(temp_dir, True)
        assert file_node_1 == file.update_filenode(file_node_1)
        file = tree.Tree()
    with pytest.raises(AttributeError):
        file.get('sister', True)


    with make_temp_directory() as temp_dir_1:
        with make_temp_directory() as temp_dir_2:
            file = tree.Tree()
            doughter_file_node = node.FileNode(temp_dir_1, True, [])
            file_node_1 = file.construct_filenode(temp_dir_2, False)
            assert None == file.filter_empty_nodes(file_node_1)

    file = tree.Tree()
    temp = tempfile.NamedTemporaryFile()
    assert file.construct_filenode(temp.name, False) == file.get(temp.name, False)
    assert None == file.get(temp.name, True, True)
    temp.close()

    with pytest.raises(AttributeError):
        temp = tempfile.NamedTemporaryFile()
        file.get(file.get(temp.name, True, False))
        temp.close()

    with make_temp_directory() as temp_dir_1:
        with make_temp_directory() as temp_dir_2:
            child1 = node.FileNode(temp_dir_1, True, [])
            assert node.FileNode(temp_dir_2, True, [child1]) != file.get(temp_dir_2, True, True)

    with make_temp_directory() as parenth:
        file = tree.Tree()
        childh_1 = tempfile.TemporaryDirectory()
        child = node.FileNode(childh_1.name, True, [])
        parent = node.FileNode(parenth, True, [child])
        assert None == file.filter_empty_nodes(parent)

    with make_temp_directory() as parenth:
        os.chdir(parenth)
        os.mkdir("child");
        file = tree.Tree()
        child = node.FileNode(child, True, [])
        parent = node.FileNode(parenth, True, [child])
        assert file.get(parenth, True, True)
        os.rmdir("child")
