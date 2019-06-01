<?php

namespace App\Http\Controllers\Web;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Category;
use App\Models\Course;
use App\Models\Page;
use App\Models\Post;
use App\Models\Video;

class HomeController extends Controller
{
    public function index() {
        $last_blog_post = Post::orderBy('id', 'DESC')->first();
        $last_message   = Post::whereHas('category', function( $q ){
            $q->where('name', 'Mural');
        })->orderBy('id', "DESC")->first();
        $last_videos    = Video::orderBy('id', 'DESC')->limit(10)->get();
        $courses        = Course::orderBy('id', 'DESC')->get();

        //return $last_videos;

        return view('web.home', compact(
            'last_blog_post',
            'last_message',
            'last_videos',
            'courses'
        ));
    }
}
