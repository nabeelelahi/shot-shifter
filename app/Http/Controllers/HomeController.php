<?php
namespace App\Http\Controllers;

use App\Models\ContentManagement;

class HomeController
{
    public function getContent($slug)
    {
        $data['content'] = ContentManagement::getBySlug($slug);
        if( !isset($data['content']->id) )
            return redirect('/');

        return view('content', $data);
    }

}
