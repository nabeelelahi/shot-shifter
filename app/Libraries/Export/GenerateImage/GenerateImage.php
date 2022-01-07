<?php

namespace App\Libraries\Export\GenerateImage;

use Anam\PhantomMagick\Converter;
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
        $html = view($this->__template_path,$this->__export_data)->render();
        $conv = new Converter();
        $conv->setBinary(base_path('phantomjs/bin/phantomjs'));
        $conv->addPage($html)->toPng()->save(public_path('pdf.jpg'));
    }
}
