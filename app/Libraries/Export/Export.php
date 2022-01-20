<?php

namespace App\Libraries\Export;

Class Export
{
    /**
     * This function is used to export file
     * @params {string} $class_name
     * @params {string} $template_path
     * @params {string} $export_data
     * @return Class Instance
     */
    public static function init($class_name,$template_path,$export_data,$extension_type = 'pdf')
    {
        $notification_file_path = '\App\Libraries\Export\\' . $class_name . '\\' . $class_name;
        return new $notification_file_path($template_path, $export_data, $extension_type);
    }
}
