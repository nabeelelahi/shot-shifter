<?php

namespace App\Libraries\Export\GenerateImage;

use Spatie\Browsershot\Browsershot;
use Illuminate\Support\Facades\Storage;
use App\Libraries\Export\ExportInterface;

class GenerateImage implements ExportInterface
{
    private $__template_path,$__export_data;

    public function __construct($template_path, $export_data)
    {
        $this->__template_path = $template_path;
        $this->__export_data   = $export_data;
    }

    public function export()
    {
        $html = view($this->__template_path,['data' => $this->__export_data])->render();
        $base_64 = Browsershot::html($html)->base64Screenshot();
        echo $base_64; exit;
    }
}
