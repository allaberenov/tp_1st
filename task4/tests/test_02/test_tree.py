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
        file = size_tree.SizeTree()
        file_node = file.construct_filenode(temp_dir, True)
        assert size_node.FileSizeNode(os.path.basename(temp_dir), True, [], os.path.getsize(temp_dir)) == file_node

    with make_temp_directory() as temp_dir:
        file = size_tree.SizeTree()
        file_node = file.construct_filenode(temp_dir, False)
        assert size_node.FileSizeNode(os.path.basename(temp_dir), False, [], os.path.getsize(temp_dir)) == file_node

    with make_temp_directory() as temp_dir:
        file = size_tree.SizeTree()
        file_node = file.construct_filenode(temp_dir, True)
        assert size_node.FileSizeNode(os.path.basename(temp_dir), True, [], os.path.getsize(temp_dir)) == file_node

    temp_file = tempfile.NamedTemporaryFile()
    file_node = file.construct_filenode(temp_file.name, False)
    assert size_node.FileSizeNode(os.path.basename(temp_file.name), False, [], os.path.getsize(temp_file.name)) == file_node
    temp_file.close()

    with make_temp_directory() as temp_dir:
        Size_tree = size_tree.SizeTree()
        temp_file = tempfile.NamedTemporaryFile()
        child = size_node.FileSizeNode(os.path.basename(temp_file.name), False, [], os.path.getsize(temp_file.name))
        parent = size_node.FileSizeNode(temp_file, True, [child], os.path.getsize(temp_file.name))
        assert parent == Size_tree.update_filenode(parent)

