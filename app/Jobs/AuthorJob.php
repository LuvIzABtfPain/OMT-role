<?php

namespace App\Jobs;

use App\Mail\ViewPostNotiAuthor;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Models\User;

class AuthorJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    private $post;
    public function __construct($post)
    {
        $this->post = $post;
        $this->queue = 'author';
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $authorID = $this->post->author_id;
        $author = User::findorFail($authorID);
        Mail::to($author)->send(new ViewPostNotiAuthor($author, $this->post));
    }
}
