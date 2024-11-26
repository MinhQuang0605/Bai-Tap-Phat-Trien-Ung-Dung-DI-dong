import 'DienThoai.dart';

class HoaDon {
 String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai; // Chứa đối tượng DienThoai
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhachHang;

  // Constructor 
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhachHang);

    // Getters
     String get maHoaDon => _maHoaDon;
     DateTime get ngayBan => _ngayBan;
     DienThoai get dienThoai => _dienThoai;
     int get soLuongMua => _soLuongMua;
     double get giaBanThucTe => _giaBanThucTe;
     String get tenKhachHang => _tenKhachHang;
     String get soDienThoaiKhachHang => _soDienThoaiKhachHang;

    // Setters
     set maHoaDon(String value){
       if (value.isEmpty || !value.startsWith('HD-')) {
      throw ArgumentError(
          'Mã hóa đơn không hợp lệ (phải có định dạng "HD-XXX").');
    }
       _maHoaDon = value;
     }

      set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không thể sau ngày hiện tại.');
    }
    _ngayBan = value;
  }
     
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoai.soLuongTon) {
      throw ArgumentError('Số lượng mua không hợp lệ.');
    }
    _soLuongMua = value;
  }

    set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
    _giaBanThucTe = value;
  }

   set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên khách hàng không được để trống.');
    }
    _tenKhachHang = value;
  }
    set soDienThoaiKhachHang(String value) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      throw ArgumentError('Số điện thoại khách hàng không hợp lệ.');
    }
    _soDienThoaiKhachHang = value;
  }
    // Phương thức tính tổng tiền thanh toán
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() =>
      (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhachHang');
  }
}