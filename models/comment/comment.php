<?php

class CommentShow
{
    public $id_danhgia;
    public $danhgiasao;
    public $name;
    public $email;
    public $noidungdanhgia;
    public $id_sanpham;

    function __construct($id_danhgia, $danhgiasao, $name, $email, $noidungdanhgia, $id_sanpham)
    {
        $this->id_danhgia = $id_danhgia;
        $this->danhgiasao = $danhgiasao;
        $this->name = $name;
        $this->email = $email;
        $this->noidungdanhgia = $noidungdanhgia;
        $this->id_sanpham = $id_sanpham;
    }


    static function showcomment()
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM danhgia,sanpham WHERE  danhgia.id_sanpham=sanpham.id_sanpham');
        foreach ($req->fetchAll() as $item) {
            $list[] = new CommentShow(
                $item['id_danhgia'],
                $item['danhgiasao'],
                $item['name'],
                $item['email'],
                $item['noidungdanhgia'],
                $item['id_sanpham']
            );
        }
        return $list;
    }

    static function insertcomment()
    {
        if (!array_key_exists('insertdanhgiasao', $_POST)) {
            echo "<div style='padding-top: 5' class='container'><div class='alert alert-danger' style='text-align: center;'>
            <strong>CẢNH BÁO!</strong>Vui lòng chọn số sao để đánh giá</div></div>";
            return false;
        }

        $data = json_encode(array(
            'star' => $_POST['insertdanhgiasao'],
            'name' => $_POST['insertname'],
            'email' => $_POST['insertemail'],
            'content' => $_POST['insertnoidungdanhgia'],
            'product_id' => $_POST['insertmsp'],
        ));

        $url = 'localhost:3000/add-review';
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS,  $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER,  array(
            "Content-Type: application/json",
            "Content-Length: " . strlen($data),
        ));

        $response = json_decode(curl_exec($curl) . PHP_EOL);
        curl_close($curl);
        if ($response->{'code'} != 200) {
            echo "<div style='padding-top: 5' class='container'><div class='alert alert-danger' style='text-align: center;'>
                <strong>Thất bại!</strong>" . $response->{'message'} . "</div></div>";
        } else {
            echo "<div style='padding-top: 5' class='container'><div class='alert alert-success' style='text-align: center;'>
                <strong>Thành công!</strong>Đánh giá thành công.</div></div>";
        }
        return true;
    }
}
