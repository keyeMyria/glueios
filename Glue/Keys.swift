//
//  Config.swift
//  Glue
//
//  Created by Macbook Pro on 28/01/18.
//  Copyright © 2018 Dzaky ZF. All rights reserved.
//

public struct Keys {
    static let URL_BASE = "http://128.199.190.115/glue/ios/"
    static let URL_CRD_COMMENT = URL_BASE+"crd_comment.php"
    static let URL_CRUD_EVENT = URL_BASE+"crud_event.php"
    static let URL_CRUD_KERJA = URL_BASE+"crud_kerja.php"
    static let URL_CRUD_TAUTAN = URL_BASE+"crud_tautan.php"
    static let URL_CRUD_UNIVERSITAS = URL_BASE+"crud_universitas.php"
    static let URL_CRUD_USER = URL_BASE+"crud_user.php"
    static let URL_CRUD_WILAYAH = URL_BASE+"crud_wilayah.php"
    static let URL_GET_NEARME = URL_BASE+"get_nearme.php"
    static let URL_LIKE_DISLIKE = URL_BASE+"like_dislike.php"
    static let URL_LOGIN = URL_BASE+"login.php"
    static let URL_RESETPASS = URL_BASE+"resetpass.php"
    static let URL_SIGNUP = URL_BASE+"signup.php"
    
    static let idevent = "idevent"
    static let event_judul = "event_judul"
    static let event_deskripsi = "event_deskripsi"
    static let event_tanggal = "event_tanggal"
    static let event_waktu = "event_waktu"
    static let event_lokasi = "event_lokasi"
    static let event_foto = "event_foto"
    static let event_thumbnail = "event_thumbnail"
    static let event_published = "event_published"
    static let event_internal = "event_internal"
    
    static let idcomment = "idcomment"
    static let event_idevent = "event_idevent"
    static let comment_text = "comment_text"
    
    static let iduniversitas = "iduniversitas"
    static let wilayah_idwilayah = "wilayah_idwilayah"
    static let universitas_nama = "universitas_nama"
    
    static let idwilayah = "idwilayah"
    static let wilayah_nama = "wilayah_nama"
    
    static let idkerja = "idkerja"
    static let kerja_jabatan = "kerja_jabatan"
    static let kerja_perusahaan = "kerja_perusahaan"
    static let kerja_lokasi = "kerja_lokasi"
    static let kerja_masuk_keluar = "kerja_masuk_keluar"
    
    static let idtautan = "idtautan"
    static let tautan_judul = "tautan_judul"
    static let tautan_text = "tautan_text"
    
    static let user_nrp = "user_nrp"
    static let user_no_kta = "user_no_kta"
    static let user_akses = "user_akses"
    static let user_nama = "user_nama"
    static let user_email = "user_email"
    static let user_password = "user_password"
    static let user_lat = "user_lat"
    static let user_lng = "user_lng"
    static let user_foto = "user_foto"
    static let user_thumbnail = "user_thumbnail"
    static let user_no_hp = "user_no_hp"
    static let user_alamat = "user_alamat"
    static let user_tempat_lahir = "user_tempat_lahir"
    static let user_tanggal_lahir = "user_tanggal_lahir"
    static let user_bio = "user_bio"
    static let user_status = "user_status"
    static let user_jk = "user_jk"
    static let user_agama = "user_agama"
    static let user_goldar = "user_goldar"
    static let user_suku = "user_suku"
    static let user_tahun_beasiswa = "user_tahun_beasiswa"
    static let kuliah_fakultas1 = "kuliah_fakultas1"
    static let kuliah_jurusan1 = "kuliah_jurusan1"
    static let kuliah_masuk_keluar1 = "kuliah_masuk_keluar1"
    static let kuliah_univ2 = "kuliah_univ2"
    static let kuliah_fakultas2 = "kuliah_fakultas2"
    static let kuliah_jurusan2 = "kuliah_jurusan2"
    static let kuliah_masuk_keluar2 = "kuliah_masuk_keluar2"
    static let ishide_no_hp = "ishide_no_hp"
    static let ishide_agama = "ishide_agama"
    static let ishide_suku = "ishide_suku"
    static let ishide_tautan = "ishide_tautan"
    
    static let mode = "mode"
    static let create = "create"
    static let read = "read"
    static let update = "update"
    static let delete = "delete"
    static let own = "own"
    static let order = "order"
    static let yes = "1"
    static let no = "0"
    static let berhasil = "berhasil"
    static let gagal = "gagal"
    static let image = "image"
    static let iduniversitas_new = "iduniversitas_new"
    static let wilayah_idwilayah_new = "wilayah_idwilayah_new"
    static let user_nrp_new = "user_nrp_new"
    static let idwilayah_new = "idwilayah_new"
    static let error_exist = "error_exist"
    static let error_nrp = "error_nrp"
    static let saved_user = "saved_user"
}

//class func DateFromString(dateString:String) -> NSDate
//{
//    let dateFormatter = DateFormatter()
//    let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
//    dateFormatter.locale = enUSPosixLocale as Locale!
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//    return dateFormatter.date(from: dateString)! as NSDate
//}

