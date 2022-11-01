<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\RoleController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function(){
    return redirect('view');
});
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/view', [\App\Http\Controllers\HomeController::class, 'view']);
Route::get('/view/{id}', [\App\Http\Controllers\HomeController::class,'view_post'])->name('view.post');
Route::post('/ud_comment/{id}', [\App\Http\Controllers\CommentController::class, 'ud_comment'])->name('ud.comment');
Route::post('/post_comment/{id}', [\App\Http\Controllers\CommentController::class, 'post_comment'])->name('post.comment');
Auth::routes();

Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {
    Route::get('/add_post', [PostController::class, 'add_post']);
    Route::post('/add_post', [PostController::class, 'add_post']);
    Route::get('/edit/{id}', [PostController::class,'edit']);
    Route::get('/delete/{id}', [PostController::class, 'delete']);
    Route::post('/edit/{id}', [PostController::class, 'edit']);
    Route::get('/post/{id}',[PostController::class, 'read']);
    Route::get('/role', [RoleController::class, 'index']);
});
