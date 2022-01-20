<?php

namespace App\Libraries\Export\CSV;

use Maatwebsite\Excel\Concerns\FromArray;

class ExportCollection implements FromArray
{

    protected $__export_data;

    public function __construct(array $export_data)
    {
        $this->__export_data = $export_data;
    }

    public function array(): array
    {
        return $this->__export_data;
    }
}
