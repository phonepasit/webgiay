<?php
require('views/home.php')
?>

<!--  -->
<div class="content-wrapper" style="min-height: 1203.6px;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh Sách Khách Hàng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php?controller=admin&action=home">Admin</a></li>
                        <li class="breadcrumb-item active">Danh Sách Khách Hàng</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12 col-md-6"></div>
                            <div class="col-sm-12 col-md-6"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">STT</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Hình ảnh</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Tên khách hàng</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Mật khẩu</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Email</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Điện thoại</th>
                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Địa chỉ</th>
                                            <th style="text-align: center;" class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Xóa</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $i =0;
                                    foreach ($user as $user){
                                        $i++;
                                    ?>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1"><?php echo $i ?></td>
                                            <td><?php echo $user->avatar ?></td>
                                            <td><?php echo $user->username ?></td>
                                            <td><?php echo $user->password ?></td>
                                            <td><?php echo $user->email ?></td>
                                            <td><?php echo $user->phone ?></td>
                                            <td><?php echo $user->diachi ?></td>

                    
                                            <td style="text-align: center;">
                                                <span class="badge bg-danger">
                                                <a href="index.php?controller=user&action=deleteUser&id_user=<?php echo $user->id_user ?>"><ion-icon name="trash-outline"></ion-icon><a>
                                                        </span>
                                            </td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                    </tbody>
                                    <!-- <tfoot>
                                        <tr>
                                            <th rowspan="1" colspan="1">STT</th>
                                            <th rowspan="1" colspan="1">Tên Danh mục</th>
                                            <th rowspan="1" colspan="1">T</th>
                                            <th rowspan="1" colspan="1">Sửa</th>
                                            <th rowspan="1" colspan="1">Xóa</th>
                                        </tr>
                                    </tfoot> -->
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </section>
</div>