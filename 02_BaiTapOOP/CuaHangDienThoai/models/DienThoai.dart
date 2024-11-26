class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai ;

  DienThoai(this._maDienThoai ,this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan,
   this._soLuongTon, this._trangThai);

   //Getters
    String get maDienThoai => _maDienThoai;
    String get tenDienThoai => _tenDienThoai;
    String get hangSanXuat => _hangSanXuat;
    double get giaNhap => _giaNhap;
    double get giaBan => _giaBan;
    int get soLuongTon => _soLuongTon;
    bool get trangThai => _trangThai;

    //Setters
    set maDienThoai(String maDienThoai){
      if(maDienThoai.contains("DT-"))
        _maDienThoai = maDienThoai;
    }
    set tenDienThoai(String tenDienThoai){
      if(tenDienThoai.isNotEmpty)
      _tenDienThoai=tenDienThoai;
    }

    set hangSanXuat(String hangSanXuat){
       if(hangSanXuat.isNotEmpty)
        _hangSanXuat=hangSanXuat;
    }

    set giaNhap(double giaNhap){
      if(giaNhap>0)
        _giaNhap=giaNhap;
    }
    set giaBan(double giaBan){
      if(giaBan>0 && giaBan>giaNhap)
        _giaBan=giaBan;
    }
    set soLuongTon(int soLuongTon){
      if(soLuongTon>0)
        _soLuongTon=soLuongTon;

    }
    double LoiNhuanDuKien(){
      return soLuongTon*giaBan;
    }
    String coTheBanDuoc()
    {
      if(trangThai==true && soLuongTon>0)
        return "Có thể bán được";
      else
        return "Không thể bán được";
    }

     void XuatThongTin(){
       print("Mã điện thoại: $_maDienThoai");
       print("Tên điện thoại: $_tenDienThoai");
       print("Hãng sản xuất: $_hangSanXuat");
       print("Giá nhập: $_giaNhap");
       print("Giá bán: $_giaBan");
       print("Số lượng tồn: $_soLuongTon");
       print("Trạng thái: $_trangThai");
       print("Lợi nhuận dự kiến: ${LoiNhuanDuKien()}");
       print("Có thể bán được: ${coTheBanDuoc()}");
     }

}