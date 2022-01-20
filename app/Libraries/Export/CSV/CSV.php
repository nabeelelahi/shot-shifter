<?php

namespace App\Libraries\Export\CSV;

use Illuminate\Support\Facades\Storage;
use App\Libraries\Export\ExportInterface;
use Excel;

class CSV implements ExportInterface
{
    private $__template_path,$__export_data, $__file_extension;

    public function __construct($template_path, $export_data, $file_extension = 'csv')
    {
        $this->__template_path    = $template_path;
        $this->__export_data      = $export_data;
        $this->__file_extension = $file_extension;
    }

    public function export()
    {
        $destination_path = 'xlsx/' . $this->__export_data->slug . '.' . $this->__file_extension;
        $export = new ExportCollection([
            [1, 2, 3],
            [4, 5, 6]
        ]);
        $store = Excel::store($export, $destination_path);
        return Storage::url($destination_path);
    }
}
