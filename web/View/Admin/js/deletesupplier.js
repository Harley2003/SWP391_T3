function confirmDelete(supplierId) {
    Swal.fire({
        title: 'Bạn chắc chắn muốn xóa?',
        text: 'Hành động này sẽ xóa nhà cung cấp này vĩnh viễn!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Xóa',
        cancelButtonText: 'Hủy bỏ'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'deletesupplier?deletesupplier=' + supplierId;
        }
    });
}