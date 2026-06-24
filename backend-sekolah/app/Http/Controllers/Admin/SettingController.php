<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    /**
     * Menampilkan halaman edit logo.
     */
    public function edit()
    {
        $site_logo = Setting::where('key', 'site_logo')->value('value');
        
        $instagram_title = Setting::where('key', 'instagram_title')->value('value') ?? 'Yuk, Kepoin Keseruan Kami di Instagram';
        $instagram_description = Setting::where('key', 'instagram_description')->value('value') ?? 'Mulai dari keseruan belajar di kelas, tawa ceria saat bermain, hingga momen-momen penuh prestasi. Semuanya kami bagikan lewat cerita harian dan galeri foto aesthetic di Instagram. Yuk, follow biar nggak ketinggalan keseruannya!';
        $instagram_url = Setting::where('key', 'instagram_url')->value('value') ?? 'https://www.instagram.com/sat_almanshurah/';
        $instagram_username = Setting::where('key', 'instagram_username')->value('value') ?? 'sat_almanshurah';
        
        return view('admin.settings.edit', compact('site_logo', 'instagram_title', 'instagram_description', 'instagram_url', 'instagram_username'));
    }

    /**
     * Memperbarui logo website (AJAX).
     */
    public function updateLogo(Request $request)
    {
        $request->validate([
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('logo')) {
            $file = $request->file('logo');
            
            // Simpan sebagai logo.png
            $filename = 'logo.png';

            // Pindahkan file ke public/uploads/
            $destinationPath = public_path('uploads');
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }
            $file->move($destinationPath, $filename);

            // Simpan path ke settings table dengan key site_logo
            Setting::updateOrCreate(
                ['key' => 'site_logo'],
                ['value' => $filename]
            );

            return response()->json([
                'status' => 'success',
                'message' => 'Logo website berhasil diperbarui!'
            ]);
        }

        return response()->json([
            'status' => 'error',
            'message' => 'Gagal mendeteksi berkas logo.'
        ], 400);
    }

    /**
     * Memperbarui pengaturan website via API (untuk Next.js).
     */
    public function updateApi(Request $request)
    {
        // Save any key-value pairs except files
        $allData = $request->except(['logo', 'sejarah_foto']);
        foreach ($allData as $key => $value) {
            if ($value !== null) {
                if (is_array($value)) {
                    Setting::updateOrCreate(['key' => $key], ['value' => json_encode($value)]);
                } else {
                    Setting::updateOrCreate(['key' => $key], ['value' => (string) $value]);
                }
            }
        }

        // Handle site logo file upload
        if ($request->hasFile('logo')) {
            $file = $request->file('logo');
            $filename = 'logo.png';
            $destinationPath = public_path('uploads');
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }
            $file->move($destinationPath, $filename);
            Setting::updateOrCreate(
                ['key' => 'site_logo'],
                ['value' => $filename]
            );
        }

        // Handle sejarah foto file upload
        if ($request->hasFile('sejarah_foto')) {
            $file = $request->file('sejarah_foto');
            $unit = $request->input('unit', 'sd');
            $filename = 'sejarah_' . $unit . '_' . time() . '.' . $file->getClientOriginalExtension();
            $destinationPath = public_path('uploads/profil');
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }
            $file->move($destinationPath, $filename);
            Setting::updateOrCreate(
                ['key' => "profil_sejarah_foto_{$unit}"],
                ['value' => $filename]
            );
        }

        $settings = Setting::pluck('value', 'key')->toArray();
        if (isset($settings['site_logo'])) {
            $settings['site_logo'] = asset('uploads/' . $settings['site_logo']);
        }
        if (isset($settings["profil_sejarah_foto_sd"])) {
            $settings["profil_sejarah_foto_sd_url"] = asset('uploads/profil/' . $settings["profil_sejarah_foto_sd"]);
        }
        if (isset($settings["profil_sejarah_foto_smp"])) {
            $settings["profil_sejarah_foto_smp_url"] = asset('uploads/profil/' . $settings["profil_sejarah_foto_smp"]);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Pengaturan website berhasil diperbarui!',
            'data' => $settings
        ]);
    }

    /**
     * Memperbarui pengaturan Instagram via Form Blade.
     */
    public function updateInstagram(Request $request)
    {
        $validated = $request->validate([
            'instagram_title' => 'required|string|max:255',
            'instagram_description' => 'required|string',
            'instagram_url' => 'required|url',
            'instagram_username' => 'required|string|max:255',
        ]);

        Setting::updateOrCreate(['key' => 'instagram_title'], ['value' => $validated['instagram_title']]);
        Setting::updateOrCreate(['key' => 'instagram_description'], ['value' => $validated['instagram_description']]);
        Setting::updateOrCreate(['key' => 'instagram_url'], ['value' => $validated['instagram_url']]);
        Setting::updateOrCreate(['key' => 'instagram_username'], ['value' => $validated['instagram_username']]);

        return response()->json([
            'status' => 'success',
            'message' => 'Pengaturan Instagram berhasil diperbarui!'
        ]);
    }
}

