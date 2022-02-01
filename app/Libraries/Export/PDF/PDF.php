<?php

namespace App\Libraries\Export\PDF;

use PDF AS DomPDF;
use Illuminate\Support\Facades\Storage;
use App\Libraries\Export\ExportInterface;

class PDF implements ExportInterface
{
    private $__template_path,$__export_data;

    public function __construct($template_path, $export_data)
    {
        $this->__template_path = $template_path;
        $this->__export_data   = $export_data;
    }

    public function export()
    {
        $destination_path = 'pdf/' . $this->__export_data->slug . '.pdf';
        $html = view($this->__template_path,['data' => $this->__export_data])->render();
        $pdf  = DomPDF::loadHTML($html)->setPaper('a4', 'landscape')->setWarnings(false);
        Storage::put($destination_path, $pdf->stream());
        return Storage::url($destination_path);
    }
}

