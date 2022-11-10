<?php

namespace App\Listeners;

use App\Events\PostViewed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Session;
use App\Models\Post;
use Illuminate\Session\Store;

class ViewCount
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    private $session;
    public function __construct(Store $session)
    {
        $this->session = $session;
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\PostViewed  $event
     * @return void
     */
    public function handle(PostViewed $event)
    {
        if (!$this->isPostViewed($event->post))
        {
            $event->post->increment('view_count');
            $this->storePost($event->post);
        }
    }
    private function isPostViewed(Post $post)
    {
        $viewed = $this->session->get('viewed_posts', []);

        return array_key_exists($post->id, $viewed);
    }

    private function storePost(Post $post)
    {
        $key = 'viewed_posts.' . $post->id;

        $this->session->put($key, time());
    }
}
