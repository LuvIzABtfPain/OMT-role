<?php

namespace App\Console\Commands;
use App\Models\Role;
use App\Models\Post;
use Illuminate\Support\Facades\Mail;
use Illuminate\Console\Command;

class HotNewsDaily extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:hotNews';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send hot News email for users';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $role = Role::where('name', 'user')->first();
        $users = $role->users;
        $max_count = \DB::table('posts')->max('view_count');
        $post =  Post::where('view_count', $max_count)->first();
        if ($users->count() > 0) {
            foreach ($users as $user) {
                Mail::to($user)->send(new \App\Mail\HotNewsDaily($user, $post));
            }
        }
    }
}
