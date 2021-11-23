<?php


namespace App\Http\Controllers;


use App\Models\ContentManagement;
use App\Models\Faq;

class FrontController
{
    public function content($slug)
    {
        $data['content'] = ContentManagement::getBySlug($slug);

        if(empty($data['content'])){
           abort("204");
        }

        return view('content', $data);
    }

    public function faq()
    {
        $data['records'] = Faq::whereNull("deleted_at")->get();

        if(empty($data['records'])){
            abort("204");
        }

        return view('faq', $data);
    }


}