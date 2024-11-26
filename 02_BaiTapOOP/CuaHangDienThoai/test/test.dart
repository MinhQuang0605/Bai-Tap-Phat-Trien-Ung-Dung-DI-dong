import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';





void main() {
  // Tạo danh sách các điện thoại
  var dienThoai1 =
      DienThoai('DT-001', 'iPhone 13', 'Apple', 2000000, 2500000, 50, true);
  var dienThoai2 =
      DienThoai('DT-002', 'Galaxy S20', 'Samsung', 1800000, 2300000, 30, true);
  var dienThoai3 =
      DienThoai('DT-003', 'OPPO A79', 'OPPO', 1700000, 2200000, 20, true);

  // Tạo danh sách cửa hàng
  var cuaHang1 = CuaHang(
    'HD-001',
    DateTime.now(),
    dienThoai1,
    2,
    25000,
    'Nguyen Van A',
    '0123456789',
    'Cửa hàng ABC',
    'Hà Nội',
  );

  var cuaHang2 = CuaHang(
    'HD-002',
    DateTime.now().subtract(Duration(days: 1)),
    dienThoai2,
    1,
    23000,
    'Nguyen Van Thi B',
    '0987654321',
    'Cửa hàng XYZ',
    'TP.HCM',
  );

  var cuaHang3 = CuaHang(
    'HD-003',
    DateTime.now().subtract(Duration(days: 2)),
    dienThoai3,
    3,
    22000,
    'Tran Van C',
    '0990768689',
    'Cửa hàng 123',
    'Đà Nẵng',
  );

 // var hoaDon1 = HoaDon("HD001", DateTime.now().subtract(Duration(days: 2)), dienThoai1, 2, 3000000, 'Tran Van C', '0990768689');
 // 2. Tạo và quản lý hóa đơn
    print("---- Quản lý hóa đơn ----");
    try {
      // Tạo hóa đơn hợp lệ
      //DienThoai dt1 = DienThoai("DT-001", "IPhone 14", "Apple", 1000, 1500, 50, true);
      //HoaDon hd1 = HoaDon("HD-001", DateTime.now(), dt1, 10, 1600, "Nguyễn Văn A", "0987654321");
      HoaDon hd1 = HoaDon("HD-001", DateTime.now(), dienThoai1, 10, 1600, "Nguyễn Văn A", "0987654321");
      hd1.hienThiThongTin();

      // Kiểm tra các ràng buộc khi tạo hóa đơn
      try {
        HoaDon hd2 = HoaDon("HD-002", DateTime.now(), dienThoai1, 60, 1600, "Nguyễn Văn B", "0908765432");
      } catch (e) {
        print("Lỗi khi tạo hóa đơn: ${e}");
      }

      // Tính toán tiền và lợi nhuận
      double tongTien = hd1.tinhTongTien();
      double loiNhuan = hd1.tinhLoiNhuanThucTe();
      print("Tổng tiền: ${tongTien}");
      print("Lợi nhuận thực tế: ${loiNhuan}");

    } catch (e) {
      print("Lỗi khi tạo hóa đơn: ${e}");
    }
  // Thêm điện thoại vào các cửa hàng
  cuaHang1.themDienThoai(dienThoai1);
  cuaHang1.themDienThoai(dienThoai2);
  cuaHang1.themDienThoai(dienThoai3);

  cuaHang2.themDienThoai(dienThoai2);
  cuaHang2.themDienThoai(dienThoai3);

  cuaHang3.themDienThoai(dienThoai1);
  cuaHang3.themDienThoai(dienThoai3);

  // Hiển thị thông tin từng cửa hàng
  print('--- Thông tin Cửa hàng 1 ---');
  cuaHang1.hienThiThongTin();
  cuaHang1.hienThiDanhSachDienThoai();

  print('\n--- Thông tin Cửa hàng 2 ---');
  cuaHang2.hienThiThongTin();
  cuaHang2.hienThiDanhSachDienThoai();

  print('\n--- Thông tin Cửa hàng 3 ---');
  cuaHang3.hienThiThongTin();
  cuaHang3.hienThiDanhSachDienThoai();
}