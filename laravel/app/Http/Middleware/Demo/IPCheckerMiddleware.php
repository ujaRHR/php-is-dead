<?php

namespace App\Http\Middleware\Demo;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IPCheckerMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $ip = $request->ip();

        if ($ip == "127.0.0.1") {
            return $next($request);
        } else {
            abort(450, "You shall not PASS!");
        }

    }
}
