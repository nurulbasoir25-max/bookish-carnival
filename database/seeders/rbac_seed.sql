INSERT INTO roles (name, display_name) VALUES
('super_admin', 'Super Admin'),
('admin_tu', 'Admin / Tata Usaha'),
('kepala_sekolah', 'Kepala Sekolah'),
('wali_kelas', 'Wali Kelas'),
('guru', 'Guru'),
('operator', 'Operator');

INSERT INTO permissions (name, display_name) VALUES
('siswa.view', 'Melihat data siswa'),
('siswa.create', 'Menambah siswa'),
('siswa.update', 'Mengubah siswa'),
('siswa.delete', 'Menghapus siswa'),
('dokumen.manage', 'Mengelola dokumen'),
('akademik.manage', 'Mengelola akademik'),
('ptk.manage', 'Mengelola PTK'),
('inventaris.manage', 'Mengelola inventaris'),
('laporan.view', 'Melihat laporan'),
('pengaturan.manage', 'Mengelola pengaturan');

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r CROSS JOIN permissions p WHERE r.name = 'super_admin';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r JOIN permissions p ON p.name IN ('siswa.view','siswa.create','siswa.update','siswa.delete','dokumen.manage','akademik.manage','ptk.manage','inventaris.manage','laporan.view') WHERE r.name = 'admin_tu';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r JOIN permissions p ON p.name IN ('siswa.view','akademik.manage','laporan.view') WHERE r.name = 'kepala_sekolah';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r JOIN permissions p ON p.name IN ('siswa.view','akademik.manage','laporan.view') WHERE r.name = 'wali_kelas';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r JOIN permissions p ON p.name IN ('siswa.view','akademik.manage') WHERE r.name = 'guru';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id FROM roles r JOIN permissions p ON p.name IN ('siswa.view','siswa.create','siswa.update','dokumen.manage') WHERE r.name = 'operator';
