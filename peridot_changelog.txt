<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gofile - Cloud Storage Made Simple</title>
    <meta name="description" content="Secure, fast and free cloud storage solution. Upload and share files instantly with Gofile's simple cloud storage platform.">
    <meta name="keywords" content="cloud storage, file sharing, file upload, secure storage, free storage">
    <meta name="author" content="Gofile Team">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://gofile.io/">
    <meta property="og:title" content="Gofile - Cloud Storage Made Simple">
    <meta property="og:description" content="Secure, fast and free cloud storage solution. Upload and share files instantly.">
    <meta property="og:image" content="https://gofile.io/dist/img/logo-small-og.png">
    <meta name="popads-verification-3578301" value="2e287dd9c5d32c7e30a9b1fd44ddde0a" />
    <link rel="canonical" href="https://gofile.io">
    <link rel="icon" type="image/png" sizes="16x16" href="/dist/img/favicon16.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="/dist/img/favicon32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="/dist/img/favicon96.png" />
    <link rel="stylesheet" href="/dist/css/output.css"/>
    <link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css"/>
    <!-- <script src="https://cdn.tailwindcss.com"></script> -->
    <script src="/dist/js/global.js"></script>
    <script src="/dist/js/framework.js"></script>
    <script src="/dist/js/blockies.min.js"></script>
</head>
<body id="index_appBody" class="font-sans antialiased bg-gray-900 text-white">
    <div id="index_notification" class="fixed top-4 right-4 w-80 max-w-full z-50 space-y-2"></div>
    <div id="index_app" class="min-h-screen flex gap-4 p-1 lg:p-4">
        <div id="index_sidebarOverlay" class="fixed inset-0 bg-gray-900 bg-opacity-50 z-5 hidden lg:hidden"></div>
        <div id="index_sidebar" class="min-w-64 max-w-72 bg-gray-800 text-white p-4 transform transition-transform lg:translate-x-0 -translate-x-full fixed lg:relative top-0 left-0 h-[calc(100vh-0.5rem)] lg:h-auto shadow-lg overflow-y-auto z-10 rounded-lg mt-1 mb-1 lg:mt-0 lg:mb-0">
            <div id="index_sidebarHeader" class="flex justify-between items-center mb-6">
                <a href="/" id="index_branding" class="flex items-center gap-2">
                    <img id="index_logo" src="/dist/img/logo-small-70.png" alt="Gofile Logo" class="h-8">
                    <h2 id="index_brandName" class="text-2xl font-bold">Gofile</h2>
                </a>
                <button id="index_closeSidebar" aria-label="Close Sidebar" class="lg:hidden bg-blue-600 hover:bg-blue-700 text-white p-1 rounded text-xs">
                    <i class="fas fa-chevron-left"></i>
                </button>
            </div>
            <div id="index_accounts" class="flex flex-col items-start mb-6">
                <div id="index_accountList" class="space-y-2 w-full">
                    <div id="index_loader" class="w-full h-full flex items-center justify-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-t-4 border-blue-500"></div>
                    </div>
                </div>
                <button role="button" aria-label="Add Account" class="index_addAccount mt-4 flex items-center justify-center gap-2 p-2 text-white bg-blue-600 hover:bg-blue-700 rounded w-full">
                    <i class="fas fa-plus-circle"></i> Add Account
                </button>
            </div>
            <ul id="index_mainNav" class="space-y-4">
                <li class="border-b border-gray-700"></li>
                <li><a href="/home" id="index_navHome" class="hover:text-blue-500 flex items-center gap-2" aria-label="Home"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="/premium" id="index_navPremium" class="hover:text-blue-500 flex items-center gap-2" aria-label="Premium"><i class="fas fa-crown"></i> Premium</a></li>
                <li><a href="/api" id="index_navApi" class="hover:text-blue-500 flex items-center gap-2" aria-label="API"><i class="fas fa-cogs"></i> API</a></li>
                <li><a href="/faq" id="index_navFaq" class="hover:text-blue-500 flex items-center gap-2" aria-label="FAQ"><i class="fas fa-question-circle"></i> FAQ</a></li>
                <li><a href="/contact" id="index_navContact" class="hover:text-blue-500 flex items-center gap-2" aria-label="Contact"><i class="fas fa-envelope"></i> Contact</a></li>
            </ul>
            <div id="index_footerSocial" class="mt-4 border-t border-gray-700 pt-4">
                <ul>
                    <li><a href="https://x.com/Gofile_io" target="_blank" rel="noopener noreferrer" class="hover:text-blue-500 flex items-center gap-2" aria-label="Gofile Twitter"><i class="fa-brands fa-x-twitter"></i> @gofile_io</a></li>
                </ul>
            </div>
        </div>
        <div id="index_content" class="flex-1 bg-gray-800 rounded-lg shadow-lg flex flex-col overflow-auto">
            <header id="index_header" class="bg-gray-800 p-2 flex items-center justify-between rounded-t-lg border-b border-gray-700">
                <button id="index_toggleSidebar" aria-label="Toggle Sidebar" class="px-2 py-1 bg-blue-600 hover:bg-blue-700 text-white rounded">
                    <i class="fas fa-bars"></i>
                </button>
                <input type="file" multiple="" class="uploadInput hidden">
            </header>
            <div id="index_upload" class="p-2 border-b border-gray-700 space-y-2 max-w-full md:max-w-5xl md:mx-auto hidden">
            </div>
            <div id="index_ads" class="flex flex-col justify-center items-center p-4 border-b border-gray-700 hidden"></div>
            <main id="index_main" class="flex-1 p-3 lg:p-6">
                <div id="index_loader" class="w-full h-full flex items-center justify-center">
                    <div class="animate-spin rounded-full h-16 w-16 border-t-4 border-blue-500"></div>
                </div>
            </main>
            <footer id="index_footer" class="bg-gray-800 p-2 text-center text-sm text-gray-400 border-t border-gray-700 rounded-b-lg flex flex-col lg:flex-row justify-between items-center space-y-2 lg:space-y-0 lg:space-x-2">
                <div class="flex flex-col items-center space-y-2 lg:flex-row lg:space-y-0 lg:space-x-2">
                    <a href="/home" class="hover:text-blue-500">Home</a>
                    <span class="hidden lg:inline">|</span>
                    <a href="/terms" class="hover:text-blue-500">Terms of Service</a>
                    <span class="hidden lg:inline">|</span>
                    <a href="/privacy" class="hover:text-blue-500">Privacy Policy</a>
                    <span class="hidden lg:inline">|</span>
                    <a href="/copyright" class="hover:text-blue-500">Copyright</a>
                    <span class="hidden lg:inline">|</span>
                    <a href="/contact" class="hover:text-blue-500">Contact</a>
                </div>
                <div class="text-center lg:text-right">
                    <p>WOJTEK SAS © <script>document.write(new Date().getFullYear());</script>, made with <span class="text-red-500">❤️</span> by Gofile Team</p>
                </div>                
            </footer>
        </div>
    </div>
</body>
</html>