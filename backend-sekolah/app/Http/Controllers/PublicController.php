<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Berita;
use App\Models\Guru;
use App\Models\Agenda;
use App\Models\Ppdb;
use App\Models\Prestasi;

class PublicController extends Controller
{
    public function getStats(Request $request)
    {
        $unit = $request->query('unit');

        $query = function($model) use ($unit) {
            if ($unit) {
                return $model::where('unit', $unit);
            }
            return $model::query();
        };

        // Check overrides from settings
        $settings = \App\Models\Setting::pluck('value', 'key');
        
        $prestasiCount = $settings->get("stats_prestasi_override_{$unit}") 
            ?? $query(Prestasi::class)->count();
            
        $guruCount = $settings->get("stats_guru_override_{$unit}") 
            ?? $query(Guru::class)->count();
            
        $siswaCount = $settings->get("stats_siswa_override_{$unit}") 
            ?? $settings->get("stats_siswa_override") 
            ?? 0;
            
        $beritaCount = $settings->get("stats_berita_override_{$unit}") 
            ?? $query(Berita::class)->where('is_published', true)->count();

        return response()->json([
            'status' => 'success',
            'data' => [
                'berita' => (int) $beritaCount,
                'guru' => (int) $guruCount,
                'agenda' => $query(Agenda::class)->count(),
                'ppdb' => $query(Ppdb::class)->count(),
                'prestasi' => (int) $prestasiCount,
                'siswa' => (int) $siswaCount,
            ]
        ]);
    }

    public function getSettings()
    {
        $settings = \App\Models\Setting::pluck('value', 'key')->toArray();
        
        // Resolve absolute URL for logo
        if (isset($settings['site_logo'])) {
            $settings['site_logo'] = asset('uploads/' . $settings['site_logo']);
        }
        
        // Resolve absolute URL for sejarah photo
        if (isset($settings['profil_sejarah_foto_sd'])) {
            $settings['profil_sejarah_foto_sd_url'] = asset('uploads/profil/' . $settings['profil_sejarah_foto_sd']);
        }
        if (isset($settings['profil_sejarah_foto_smp'])) {
            $settings['profil_sejarah_foto_smp_url'] = asset('uploads/profil/' . $settings['profil_sejarah_foto_smp']);
        }

        // Default values
        $settings['instagram_title'] = $settings['instagram_title'] ?? 'Yuk, Kepoin Keseruan Kami di Instagram';
        $settings['instagram_description'] = $settings['instagram_description'] ?? 'Mulai dari keseruan belajar di kelas, tawa ceria saat bermain, hingga momen-momen penuh prestasi. Semuanya kami bagikan lewat cerita harian dan galeri foto aesthetic di Instagram. Yuk, follow biar nggak ketinggalan keseruannya!';
        $settings['instagram_url'] = $settings['instagram_url'] ?? 'https://www.instagram.com/sat_almanshurah/';
        $settings['instagram_username'] = $settings['instagram_username'] ?? 'sat_almanshurah';
        $settings['tiktok_url'] = $settings['tiktok_url'] ?? '';
        $settings['whatsapp_number'] = $settings['whatsapp_number'] ?? '6281534648183';

        return response()->json($settings);
    }
}
