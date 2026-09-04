<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>万度搜索</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* ============================================================
               全局重置
               ============================================================ */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: "PingFang SC", "Microsoft YaHei", Arial, sans-serif;
            background: #f1f3f6;
            color: #1a1a2e;
            font-size: 14px;
            line-height: 1.6;
        }
        a {
            text-decoration: none;
            color: #1a2a6c;
        }
        a:hover {
            text-decoration: underline;
        }

        /* ============================================================
               顶部导航栏
               ============================================================ */
        .top-nav {
            background: #ffffff;
            border-bottom: 1px solid #e4e7ed;
            padding: 0 4%;
            height: 36px;
            display: flex;
            align-items: center;
            gap: 18px;
            font-size: 12px;
            color: #666;
        }
        .top-nav a {
            color: #666;
        }
        .top-nav a:hover {
            color: #1a2a6c;
            text-decoration: none;
        }
        .top-nav .sep {
            color: #ddd;
        }
        .top-nav .right {
            margin-left: auto;
            display: flex;
            gap: 14px;
        }
        .top-nav .right .msg {
            color: #e74c3c;
            font-weight: 600;
        }

        /* ============================================================
               主导航栏
               ============================================================ */
        .main-nav {
            background: #ffffff;
            padding: 0 4%;
            height: 48px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #e4e7ed;
            gap: 0;
            flex-wrap: wrap;
        }
        .logo-area {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-right: 28px;
            flex-shrink: 0;
        }
        .logo-area img {
            height: 30px;
            width: auto;
            display: block;
        }
        .logo-area .logo-text {
            font-size: 22px;
            font-weight: 700;
            color: #1a2a6c;
            letter-spacing: -0.5px;
        }
        .logo-area .logo-text .dot {
            color: #e74c3c;
        }
        .main-nav .nav-item {
            padding: 0 12px;
            height: 48px;
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #444;
            border-bottom: 3px solid transparent;
            cursor: pointer;
            transition: 0.2s;
            white-space: nowrap;
        }
        .main-nav .nav-item:hover {
            color: #1a2a6c;
            border-bottom-color: #1a2a6c;
        }
        .main-nav .nav-item.active {
            color: #1a2a6c;
            border-bottom-color: #1a2a6c;
            font-weight: 600;
        }
        .main-nav .nav-right {
            margin-left: auto;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13px;
            color: #888;
        }

        /* ============================================================
               搜索区
               ============================================================ */
        .search-section {
            background: #ffffff;
            padding: 14px 4% 10px;
            border-bottom: 1px solid #e4e7ed;
            display: flex;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
        }
        .search-section .search-box {
            flex: 1;
            min-width: 200px;
            max-width: 620px;
            display: flex;
            align-items: center;
            border: 2px solid #1a2a6c;
            border-radius: 4px;
            background: #fff;
        }
        .search-section .search-box input {
            flex: 1;
            height: 36px;
            border: none;
            padding: 0 14px;
            font-size: 15px;
            outline: none;
            background: transparent;
            min-width: 80px;
        }
        .search-section .search-box button {
            height: 36px;
            padding: 0 24px;
            background: #1a2a6c;
            color: #fff;
            border: none;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border-radius: 0 3px 3px 0;
            transition: background 0.2s;
            white-space: nowrap;
        }
        .search-section .search-box button:hover {
            background: #0f1a4a;
        }
        .search-section .hot-tags {
            font-size: 13px;
            color: #888;
            display: flex;
            align-items: center;
            gap: 4px;
            flex-wrap: wrap;
        }
        .search-section .hot-tags .label {
            color: #999;
        }
        .search-section .hot-tags .tag {
            color: #1a2a6c;
            cursor: pointer;
            padding: 1px 10px;
            background: #f0f4ff;
            border-radius: 12px;
            font-size: 12px;
            transition: 0.2s;
        }
        .search-section .hot-tags .tag:hover {
            background: #1a2a6c;
            color: #fff;
        }

        /* ============================================================
               新闻分类导航
               ============================================================ */
        .news-tabs {
            background: #ffffff;
            padding: 0 4%;
            border-bottom: 2px solid #e4e7ed;
            display: flex;
            gap: 0;
            height: 38px;
            align-items: center;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
        .news-tabs::-webkit-scrollbar {
            height: 0;
        }
        .news-tabs .tab {
            padding: 0 14px;
            height: 38px;
            display: flex;
            align-items: center;
            font-size: 13px;
            color: #555;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            transition: 0.2s;
            white-space: nowrap;
        }
        .news-tabs .tab:hover {
            color: #1a2a6c;
        }
        .news-tabs .tab.active {
            color: #1a2a6c;
            font-weight: 600;
            border-bottom-color: #1a2a6c;
        }

        /* ============================================================
               主内容区 - 三栏等高
               ============================================================ */
        .main-content {
            max-width: 1280px;
            margin: 14px auto 0;
            padding: 0 16px 20px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 18px;
            align-items: stretch;
        }

        /* 每一列内部是flex列，撑满高度 */
        .col-left,
        .col-mid,
        .col-right {
            display: flex;
            flex-direction: column;
        }

        /* ---------- 通用卡片 ---------- */
        .news-card {
            background: #ffffff;
            border-radius: 4px;
            padding: 12px 14px;
            margin-bottom: 10px;
            border: 1px solid #eaedf2;
            cursor: pointer;
            transition: box-shadow 0.2s;
        }
        .news-card:hover {
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }
        .news-card .title {
            font-size: 15px;
            font-weight: 500;
            color: #1a2a6c;
            line-height: 1.5;
            margin-bottom: 4px;
        }
        .news-card .title:hover {
            text-decoration: underline;
        }
        .news-card .meta {
            font-size: 12px;
            color: #999;
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }
        .news-card .meta .tag {
            font-size: 11px;
            color: #666;
            background: #f0f2f5;
            padding: 0 8px;
            border-radius: 3px;
        }
        .news-card .meta .tag.hot {
            background: #fde8e8;
            color: #c0392b;
        }

        /* 带图片的卡片 */
        .news-card.with-img {
            display: flex;
            gap: 12px;
            align-items: flex-start;
        }
        .news-card.with-img .thumb {
            width: 110px;
            height: 66px;
            flex-shrink: 0;
            background-color: #e8ecf2;
            background-size: cover;
            background-position: center;
            border-radius: 3px;
        }
        .news-card.with-img .info {
            flex: 1;
            min-width: 0;
        }
        .news-card.with-img .info .title {
            font-size: 15px;
        }

        /* ---------- 列标题 ---------- */
        .col-left .section-title,
        .col-mid .section-title,
        .col-right .section-title {
            font-size: 15px;
            font-weight: 600;
            color: #1a2a6c;
            padding-bottom: 6px;
            border-bottom: 2px solid #1a2a6c;
            margin-bottom: 10px;
            flex-shrink: 0;
        }

        /* ============================================================
               左栏 - 大图轮播
               ============================================================ */
        .carousel-wrap {
            position: relative;
            width: 100%;
            height: 180px;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 12px;
            flex-shrink: 0;
            background: #1a1f2e;
        }
        .carousel-wrap .slides {
            display: flex;
            width: 300%;
            height: 100%;
            animation: carousel-slide 15s ease-in-out infinite;
        }
        .carousel-wrap .slides .slide {
            width: 33.333%;
            height: 100%;
            background-size: cover;
            background-position: center;
            position: relative;
            flex-shrink: 0;
        }
        .carousel-wrap .slides .slide .overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 30px 18px 14px;
            background: linear-gradient(transparent, rgba(0,0,0,0.7));
            color: #fff;
        }
        .carousel-wrap .slides .slide .overlay .title {
            font-size: 15px;
            font-weight: 600;
            line-height: 1.4;
        }
        .carousel-wrap .slides .slide .overlay .sub {
            font-size: 12px;
            opacity: 0.8;
            margin-top: 2px;
        }
        @keyframes carousel-slide {
            0%, 25% { transform: translateX(0); }
            33%, 58% { transform: translateX(-33.333%); }
            66%, 91% { transform: translateX(-66.666%); }
            100% { transform: translateX(0); }
        }

        /* 轮播指示点 */
        .carousel-dots {
            position: absolute;
            bottom: 8px;
            right: 14px;
            display: flex;
            gap: 6px;
            z-index: 2;
        }
        .carousel-dots .dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: rgba(255,255,255,0.4);
            transition: 0.3s;
        }
        .carousel-dots .dot.active {
            background: #fff;
            width: 20px;
            border-radius: 4px;
        }
        /* 动画对应指示点 */
        @keyframes dot1 { 0%, 25% { width:20px; background:#fff; } 26%, 100% { width:8px; background:rgba(255,255,255,0.4); } }
        @keyframes dot2 { 0%, 25% { width:8px; background:rgba(255,255,255,0.4); } 26%, 58% { width:20px; background:#fff; } 59%, 100% { width:8px; background:rgba(255,255,255,0.4); } }
        @keyframes dot3 { 0%, 58% { width:8px; background:rgba(255,255,255,0.4); } 59%, 91% { width:20px; background:#fff; } 92%, 100% { width:8px; background:rgba(255,255,255,0.4); } }
        .carousel-dots .dot:nth-child(1) { animation: dot1 15s infinite; }
        .carousel-dots .dot:nth-child(2) { animation: dot2 15s infinite; }
        .carousel-dots .dot:nth-child(3) { animation: dot3 15s infinite; }

        /* ============================================================
               右栏
               ============================================================ */
        .col-right .side-block {
            background: #ffffff;
            border-radius: 4px;
            padding: 12px 14px;
            margin-bottom: 10px;
            border: 1px solid #eaedf2;
            flex-shrink: 0;
        }
        .col-right .side-block .block-title {
            font-size: 14px;
            font-weight: 600;
            color: #1a2a6c;
            padding-bottom: 6px;
            border-bottom: 2px solid #e4e7ed;
            margin-bottom: 8px;
        }
        /* 右栏最后一个区块撑满剩余空间 */
        .col-right .side-block:last-child {
            flex: 1;
        }

        /* 热榜 */
        .rank-list .rank-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 5px 0;
            border-bottom: 1px solid #f4f4f4;
            cursor: pointer;
            font-size: 13px;
        }
        .rank-list .rank-item:last-child {
            border-bottom: none;
        }
        .rank-list .rank-item .num {
            font-weight: 700;
            color: #bbb;
            min-width: 20px;
            text-align: center;
            font-size: 12px;
        }
        .rank-list .rank-item .num.top1 {
            color: #e74c3c;
        }
        .rank-list .rank-item .num.top2 {
            color: #e67e22;
        }
        .rank-list .rank-item .num.top3 {
            color: #2980b9;
        }
        .rank-list .rank-item .text {
            flex: 1;
            color: #333;
        }
        .rank-list .rank-item .text:hover {
            color: #1a2a6c;
            text-decoration: underline;
        }
        .rank-list .rank-item .badge {
            font-size: 10px;
            color: #666;
            background: #f0f2f5;
            padding: 0 8px;
            border-radius: 10px;
        }

        /* 便民服务 */
        .service-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 3px;
        }
        .service-grid .svc {
            text-align: center;
            padding: 6px 0;
            font-size: 12px;
            color: #555;
            cursor: pointer;
            border-radius: 3px;
            transition: background 0.2s;
        }
        .service-grid .svc:hover {
            background: #f0f4ff;
        }
        .service-grid .svc .icon {
            font-size: 18px;
            display: block;
            margin-bottom: 1px;
        }

        /* ============================================================
               滚动快讯
               ============================================================ */
        .ticker-wrap {
            max-width: 1280px;
            margin: 0 auto 12px;
            padding: 0 16px;
        }
        .ticker-box {
            background: #1a1f2e;
            border-radius: 4px;
            padding: 0 14px;
            height: 34px;
            display: flex;
            align-items: center;
            overflow: hidden;
        }
        .ticker-box .label {
            flex-shrink: 0;
            background: #e74c3c;
            color: #fff;
            font-size: 11px;
            font-weight: 700;
            padding: 0 10px;
            border-radius: 3px;
            margin-right: 12px;
        }
        .ticker-box .track {
            flex: 1;
            overflow: hidden;
            position: relative;
            height: 100%;
        }
        .ticker-box .track .list {
            display: flex;
            white-space: nowrap;
            animation: scroll 30s linear infinite;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 0;
        }
        .ticker-box .track .list .item {
            font-size: 12px;
            color: #c8d0e0;
            padding: 0 20px;
            border-right: 1px solid #3a4a6a;
            cursor: pointer;
            transition: color 0.2s;
        }
        .ticker-box .track .list .item:hover {
            color: #fff;
        }
        .ticker-box .track .list .item .time {
            color: #7f8fa4;
            margin-right: 6px;
        }
        @keyframes scroll {
            0% { transform: translateY(-50%) translateX(0); }
            100% { transform: translateY(-50%) translateX(-50%); }
        }

        /* ============================================================
               底部
               ============================================================ */
        .footer-bottom {
            max-width: 1280px;
            margin: 0 auto 16px;
            padding: 0 16px;
        }
        .footer-links {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 3px 24px;
            padding: 12px 0;
            border-top: 1px solid #e4e7ed;
            border-bottom: 1px solid #e4e7ed;
            margin-bottom: 10px;
        }
        .footer-links .link {
            font-size: 12px;
            color: #888;
            cursor: pointer;
            padding: 2px 0;
            border-bottom: 1px dotted #f4f4f4;
            display: flex;
            justify-content: space-between;
        }
        .footer-links .link:hover {
            color: #1a2a6c;
        }
        .footer-links .link .date {
            font-size: 11px;
            color: #bbb;
        }
        .copyright {
            font-size: 12px;
            color: #bbb;
            text-align: center;
        }
        .copyright a {
            color: #bbb;
            margin: 0 6px;
        }
        .copyright a:hover {
            color: #1a2a6c;
            text-decoration: none;
        }

        /* ============================================================
               弹窗
               ============================================================ */
        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.45);
            backdrop-filter: blur(2px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 999;
            padding: 20px;
        }
        .modal-box {
            background: #fff;
            padding: 32px 36px 28px;
            max-width: 420px;
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.25);
            text-align: center;
            animation: fadeUp 0.4s ease;
        }
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .modal-box .icon {
            font-size: 34px;
            margin-bottom: 2px;
        }
        .modal-box h2 {
            font-size: 18px;
            color: #1a2a6c;
            font-weight: 600;
            margin-bottom: 2px;
        }
        .modal-box .sub {
            font-size: 12px;
            color: #999;
            margin-bottom: 12px;
        }
        .modal-box .letter {
            font-size: 15px;
            line-height: 1.9;
            color: #333;
            background: #f8fafc;
            padding: 14px 18px;
            border-radius: 6px;
            border-left: 3px solid #1a2a6c;
            text-align: left;
            margin-bottom: 20px;
        }
        .modal-box .letter strong {
            color: #1a2a6c;
        }
        .btn-start {
            background: #1a2a6c;
            color: #fff;
            border: none;
            padding: 10px 36px;
            font-size: 15px;
            font-weight: 500;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn-start:hover {
            background: #0f1a4a;
        }

        /* ============================================================
               响应式
               ============================================================ */

        /* 平板：两栏 */
        @media (max-width: 1024px) {
            .main-content {
                grid-template-columns: 1fr 1fr;
                gap: 14px;
            }
            .footer-links {
                grid-template-columns: repeat(2, 1fr);
            }
            .top-nav {
                padding: 0 3%;
                gap: 12px;
                font-size: 11px;
                height: 32px;
            }
            .main-nav {
                padding: 0 3%;
                height: 44px;
            }
            .search-section {
                padding: 10px 3%;
            }
            .news-tabs {
                padding: 0 3%;
            }
            .carousel-wrap {
                height: 150px;
            }
        }

        /* 手机：单栏 */
        @media (max-width: 640px) {
            .top-nav .right .msg {
                display: none;
            }
            .top-nav .sep {
                display: none;
            }
            .top-nav a:not(:first-child) {
                display: none;
            }
            .top-nav .right a {
                display: inline;
            }

            .main-nav {
                height: auto;
                padding: 6px 3%;
                gap: 2px;
            }
            .main-nav .nav-item {
                height: 30px;
                padding: 0 8px;
                font-size: 13px;
                border-bottom-width: 2px;
            }
            .logo-area {
                margin-right: 12px;
            }
            .logo-area .logo-text {
                font-size: 18px;
            }
            .main-nav .nav-right {
                font-size: 12px;
            }

            .search-section {
                flex-direction: column;
                align-items: stretch;
                gap: 6px;
                padding: 10px 3%;
            }
            .search-section .search-box {
                max-width: 100%;
            }
            .search-section .search-box input {
                height: 34px;
                font-size: 14px;
            }
            .search-section .search-box button {
                height: 34px;
                padding: 0 16px;
                font-size: 13px;
            }
            .search-section .hot-tags {
                font-size: 12px;
                justify-content: center;
            }

            .news-tabs {
                height: 34px;
                padding: 0 3%;
            }
            .news-tabs .tab {
                height: 34px;
                padding: 0 10px;
                font-size: 12px;
            }

            .main-content {
                grid-template-columns: 1fr;
                gap: 0;
                padding: 0 10px 16px;
                margin-top: 10px;
            }
            .col-left .section-title,
            .col-mid .section-title,
            .col-right .section-title {
                font-size: 14px;
                margin-top: 4px;
            }

            .news-card {
                padding: 10px 12px;
                margin-bottom: 8px;
            }
            .news-card .title {
                font-size: 14px;
            }
            .news-card.with-img {
                gap: 10px;
            }
            .news-card.with-img .thumb {
                width: 90px;
                height: 56px;
            }
            .news-card.with-img .info .title {
                font-size: 14px;
            }

            .carousel-wrap {
                height: 140px;
                margin-bottom: 8px;
            }
            .carousel-wrap .slides .slide .overlay .title {
                font-size: 14px;
            }
            .carousel-wrap .slides .slide .overlay .sub {
                font-size: 11px;
            }

            .col-right .side-block {
                padding: 10px 12px;
                margin-bottom: 8px;
            }

            .footer-links {
                grid-template-columns: 1fr 1fr;
                gap: 2px 16px;
                padding: 10px 0;
            }
            .footer-links .link {
                font-size: 12px;
            }
            .copyright {
                font-size: 11px;
            }
            .copyright a {
                margin: 0 4px;
            }

            .modal-box {
                padding: 24px 20px 22px;
                margin: 0 10px;
            }
            .modal-box .letter {
                font-size: 14px;
                padding: 12px 14px;
            }
            .modal-box h2 {
                font-size: 17px;
            }

            .ticker-wrap {
                padding: 0 10px;
            }
            .ticker-box {
                height: 30px;
                padding: 0 10px;
            }
            .ticker-box .label {
                font-size: 10px;
                padding: 0 8px;
                margin-right: 8px;
            }
            .ticker-box .track .list .item {
                font-size: 11px;
                padding: 0 14px;
            }

            .service-grid {
                grid-template-columns: repeat(4, 1fr);
            }
            .service-grid .svc {
                font-size: 11px;
                padding: 4px 0;
            }
            .service-grid .svc .icon {
                font-size: 16px;
            }
        }

        @media (max-width: 400px) {
            .main-nav .nav-item {
                font-size: 12px;
                padding: 0 6px;
            }
            .logo-area .logo-text {
                font-size: 16px;
            }
            .news-card.with-img .thumb {
                width: 70px;
                height: 44px;
            }
            .footer-links {
                grid-template-columns: 1fr;
            }
            .carousel-wrap {
                height: 110px;
            }
            .carousel-wrap .slides .slide .overlay {
                padding: 20px 12px 10px;
            }
            .carousel-wrap .slides .slide .overlay .title {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>

    <!-- ============================================================
    1. 顶部导航栏
    ============================================================ -->
    <div class="top-nav">
        <a href="#">设为首页</a>
        <span class="sep">|</span>
        <a href="#">收藏万度</a>
        <span class="sep">|</span>
        <a href="#">帮助</a>
        <div class="right">
            <a href="#">登录</a>
            <a href="#">注册</a>
            <span class="msg">消息(3)</span>
        </div>
    </div>

    <!-- ============================================================
    2. 主导航栏 + Logo
    ============================================================ -->
    <div class="main-nav">
        <div class="logo-area">
            <img src="images/logo.png" alt="万度" onerror="this.style.display='none'">
            <span class="logo-text">万<span class="dot">·</span>度</span>
        </div>
        <span class="nav-item active">首页</span>
        <span class="nav-item">新闻</span>
        <span class="nav-item">贴吧</span>
        <span class="nav-item">图片</span>
        <span class="nav-item">视频</span>
        <span class="nav-item">地图</span>
        <span class="nav-item">百科</span>
        <span class="nav-item">网盘</span>
        <div class="nav-right">
            <span>🌐</span>
            <span>侦探·未命名</span>
        </div>
    </div>

    <!-- ============================================================
    3. 搜索区
    ============================================================ -->
    <div class="search-section">
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="万度一下，你就知道" autofocus>
            <button onclick="doSearch()">搜索</button>
        </div>
        <div class="hot-tags">
            <span class="label">热门：</span>
            <span class="tag" onclick="hotSearch('万象汇开业')">万象汇开业</span>
            <span class="tag" onclick="hotSearch('古镇NPC爆火')">古镇NPC爆火</span>
            <span class="tag" onclick="hotSearch('拒绝酒驾专项行动')">拒绝酒驾</span>
            <span class="tag" onclick="hotSearch('全国编程大赛')">编程大赛</span>
            <span class="tag" onclick="hotSearch('老城区道路整改')">道路整改</span>
        </div>
    </div>

    <!-- ============================================================
    4. 新闻分类标签
    ============================================================ -->
    <div class="news-tabs">
        <span class="tab active">最新</span>
        <span class="tab">本地</span>
        <span class="tab">热点</span>
        <span class="tab">社会</span>
        <span class="tab">法治</span>
        <span class="tab">教育</span>
        <span class="tab">科技</span>
        <span class="tab">娱乐</span>
        <span class="tab">体育</span>
        <span class="tab">财经</span>
        <span class="tab">生活</span>
    </div>

    <!-- ============================================================
    5. 主内容三栏
    ============================================================ -->
    <div class="main-content">

        <!-- ====== 左栏 ====== -->
        <div class="col-left">
            <div class="section-title">📰 焦点新闻</div>

            <!-- 大图轮播 -->
            <div class="carousel-wrap">
                <div class="slides">
                    <!-- 图1：车祸新闻配图 -->
                    <div class="slide" style="background-image: url('https://picsum.photos/800/350?random=10');">
                        <div class="overlay" onclick="location.href='page-news1.html'">
                            <div class="title">17岁学生放学途中遇祸 醉驾司机致两命悲剧</div>
                            <div class="sub">本地新闻网 · 今日10:23</div>
                        </div>
                    </div>
                    <!-- 图2：高考新闻 -->
                    <div class="slide" style="background-image: url('https://picsum.photos/800/350?random=11');">
                        <div class="overlay" onclick="location.href='#'">
                            <div class="title">高考倒计时20天！各地多举措护航1291万考生</div>
                            <div class="sub">教育部官网 · 今日09:30</div>
                        </div>
                    </div>
                    <!-- 图3：古镇花经济 -->
                    <div class="slide" style="background-image: url('https://picsum.photos/800/350?random=12');">
                        <div class="overlay" onclick="location.href='#'">
                            <div class="title">春日"花经济"持续升温 古镇赏花路线成网红打卡地</div>
                            <div class="sub">文旅局 · 3天前</div>
                        </div>
                    </div>
                </div>
                <div class="carousel-dots">
                    <span class="dot active"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>

            <!-- 常规新闻卡片（填充） -->
            <div class="news-card" onclick="location.href='#'">
                <div class="title">一季度GDP同比增长6.8%，新兴制造业贡献突出</div>
                <div class="meta">
                    <span class="tag">财经</span>
                    <span>市政府网</span>
                    <span>昨日17:45</span>
                    <span>评论 34</span>
                </div>
            </div>

            <div class="news-card" onclick="location.href='#'">
                <div class="title">工业大模型赋能制造业，批量打造"工业特种兵"</div>
                <div class="meta">
                    <span class="tag">科技</span>
                    <span>科技日报</span>
                    <span>4天前</span>
                    <span>评论 67</span>
                </div>
            </div>

            <div class="news-card" onclick="location.href='#'">
                <div class="title">共享电动车新规实施，划定120个规范停放点</div>
                <div class="meta">
                    <span class="tag">民生</span>
                    <span>都市报</span>
                    <span>3天前</span>
                    <span>评论 45</span>
                </div>
            </div>
        </div>

        <!-- ====== 中栏 ====== -->
        <div class="col-mid">
            <div class="section-title">📌 综合新闻</div>

            <!-- 网络思潮（线索） -->
            <div class="news-card" onclick="location.href='page-news2.html'">
                <div class="title">网络不良思潮隐蔽渗透，多地校园强化青少年思想心理引导</div>
                <div class="meta">
                    <span class="tag">教育</span>
                    <span>教育周刊</span>
                    <span>4天前</span>
                    <span>评论 210</span>
                </div>
            </div>

            <!-- 扫黑除恶（线索） -->
            <div class="news-card" onclick="location.href='page-news3.html'">
                <div class="title">全国常态化扫黑除恶纵深推进，多领域专项整治落地见效</div>
                <div class="meta">
                    <span class="tag">法治</span>
                    <span>法治时政</span>
                    <span>4天前</span>
                    <span>评论 402</span>
                </div>
            </div>

            <!-- 编程大赛（线索） -->
            <div class="news-card" onclick="location.href='page-news4.html'">
                <div class="title">全国中学生计算机程序设计大赛圆满收官，各地重点中学捷报频传</div>
                <div class="meta">
                    <span class="tag">教育</span>
                    <span>教育资讯</span>
                    <span>4天前</span>
                    <span>评论 156</span>
                </div>
            </div>

            <!-- 娱乐填充 -->
            <div class="news-card" onclick="location.href='#'">
                <div class="title">顶流明星新剧开机，搭档95后小花，片场路透曝光</div>
                <div class="meta">
                    <span class="tag">娱乐</span>
                    <span>娱乐星闻</span>
                    <span>今日09:18</span>
                    <span>评论 1.2k</span>
                </div>
            </div>

            <div class="news-card" onclick="location.href='#'">
                <div class="title">选秀综艺导师互怼冲上热搜，网友：剧本痕迹太重</div>
                <div class="meta">
                    <span class="tag">娱乐</span>
                    <span>八卦速递</span>
                    <span>今日11:05</span>
                    <span>评论 856</span>
                </div>
            </div>

            <div class="news-card" onclick="location.href='#'">
                <div class="title">足球联赛落幕，主场获胜带动文旅消费涨17%</div>
                <div class="meta">
                    <span class="tag">体育</span>
                    <span>体育网</span>
                    <span>3天前</span>
                    <span>评论 89</span>
                </div>
            </div>

            <div class="news-card" onclick="location.href='#'">
                <div class="title">非遗美食南下"熬"出圈，首店排起长队</div>
                <div class="meta">
                    <span class="tag">生活</span>
                    <span>美食周刊</span>
                    <span>昨日12:30</span>
                    <span>评论 203</span>
                </div>
            </div>
        </div>

        <!-- ====== 右栏 ====== -->
        <div class="col-right">

            <!-- 天气 -->
            <div class="side-block">
                <div class="block-title">🌤 今日天气</div>
                <div style="display:flex; align-items:center; gap:14px; padding:2px 0;">
                    <span style="font-size:28px; font-weight:300; color:#1a2a6c;">28<span style="font-size:15px;">°C</span></span>
                    <div style="font-size:13px; color:#555;">
                        <div>晴间多云</div>
                        <div style="font-size:12px; color:#999;">风力3-4级 · 湿度62%</div>
                    </div>
                </div>
                <div style="display:flex; gap:6px; margin-top:4px; flex-wrap:wrap;">
                    <span style="font-size:11px; color:#888; background:#f0f2f5; padding:0 10px; border-radius:10px;">🏃 适宜户外</span>
                    <span style="font-size:11px; color:#888; background:#f0f2f5; padding:0 10px; border-radius:10px;">😷 良</span>
                    <span style="font-size:11px; color:#888; background:#f0f2f5; padding:0 10px; border-radius:10px;">☀ 紫外线中等</span>
                </div>
            </div>

            <!-- 便民服务 -->
            <div class="side-block">
                <div class="block-title">📱 生活服务</div>
                <div class="service-grid">
                    <div class="svc"><span class="icon">🚌</span>公交</div>
                    <div class="svc"><span class="icon">🚗</span>路况</div>
                    <div class="svc"><span class="icon">🏥</span>挂号</div>
                    <div class="svc"><span class="icon">📮</span>快递</div>
                    <div class="svc"><span class="icon">🏦</span>银行</div>
                    <div class="svc"><span class="icon">🍜</span>外卖</div>
                    <div class="svc"><span class="icon">🎫</span>票务</div>
                    <div class="svc"><span class="icon">🗺</span>导航</div>
                </div>
            </div>

            <!-- 24小时热榜 -->
            <div class="side-block">
                <div class="block-title">🔥 24小时热榜</div>
                <div class="rank-list">
                    <div class="rank-item" onclick="location.href='page-news1.html'">
                        <span class="num top1">1</span>
                        <span class="text">放学途中车祸 醉驾司机致2死</span>
                        <span class="badge">热</span>
                    </div>
                    <div class="rank-item" onclick="location.href='#'">
                        <span class="num top2">2</span>
                        <span class="text">大型购物中心开业首日破10万人流</span>
                    </div>
                    <div class="rank-item" onclick="location.href='#'">
                        <span class="num top3">3</span>
                        <span class="text">古镇NPC互动爆火短视频平台</span>
                    </div>
                    <div class="rank-item" onclick="location.href='page-news4.html'">
                        <span class="num">4</span>
                        <span class="text">全国编程大赛 多所重点中学获奖</span>
                    </div>
                    <div class="rank-item" onclick="location.href='page-news3.html'">
                        <span class="num">5</span>
                        <span class="text">特大涉黑案二审宣判</span>
                    </div>
                    <div class="rank-item" onclick="location.href='#'">
                        <span class="num">6</span>
                        <span class="text">老城区道路整改提上日程</span>
                    </div>
                    <div class="rank-item" onclick="location.href='#'">
                        <span class="num">7</span>
                        <span class="text">"拒绝酒驾"专项行动全市启动</span>
                    </div>
                    <div class="rank-item" onclick="location.href='#'">
                        <span class="num">8</span>
                        <span class="text">非遗美食南下首店排长队</span>
                    </div>
                </div>
            </div>

            <!-- 广告位（弹性撑满） -->
            <div class="side-block" style="border:1px dashed #d0d7de; background:#f8f9fa; text-align:center; color:#bbb; font-size:12px; padding:10px; flex:1; display:flex; align-items:center; justify-content:center;">
                📢 广告位 · 品牌合作
            </div>
        </div>
    </div>

    <!-- ============================================================
    6. 滚动快讯
    ============================================================ -->
    <div class="ticker-wrap">
        <div class="ticker-box">
            <span class="label">快讯</span>
            <div class="track">
                <div class="list">
                    <span class="item" onclick="location.href='page-news3.html'"><span class="time">15:32</span>警方破获野外流动赌场 抓获60余人</span>
                    <span class="item" onclick="location.href='page-news1.html'"><span class="time">14:10</span>醉驾司机血检结果公布 超醉驾标准数倍</span>
                    <span class="item" onclick="location.href='#'"><span class="time">13:45</span>教育科创新城规划公示</span>
                    <span class="item" onclick="location.href='page-news4.html'"><span class="time">11:20</span>全国编程大赛 多校选手斩获佳绩</span>
                    <span class="item" onclick="location.href='#'"><span class="time">10:05</span>古镇赏花路线成网红打卡地</span>
                    <span class="item" onclick="location.href='#'"><span class="time">09:30</span>一季度GDP同比增长6.8%</span>
                    <span class="item" onclick="location.href='#'"><span class="time">08:50</span>古镇古风NPC互动话题播放量破3亿</span>
                    <!-- 复制 -->
                    <span class="item" onclick="location.href='page-news3.html'"><span class="time">15:32</span>警方破获野外流动赌场 抓获60余人</span>
                    <span class="item" onclick="location.href='page-news1.html'"><span class="time">14:10</span>醉驾司机血检结果公布 超醉驾标准数倍</span>
                    <span class="item" onclick="location.href='#'"><span class="time">13:45</span>教育科创新城规划公示</span>
                    <span class="item" onclick="location.href='page-news4.html'"><span class="time">11:20</span>全国编程大赛 多校选手斩获佳绩</span>
                    <span class="item" onclick="location.href='#'"><span class="time">10:05</span>古镇赏花路线成网红打卡地</span>
                    <span class="item" onclick="location.href='#'"><span class="time">09:30</span>一季度GDP同比增长6.8%</span>
                    <span class="item" onclick="location.href='#'"><span class="time">08:50</span>古镇古风NPC互动话题播放量破3亿</span>
                </div>
            </div>
        </div>
    </div>

    <!-- ============================================================
    7. 底部
    ============================================================ -->
    <div class="footer-bottom">
        <div class="footer-links">
            <span class="link" onclick="location.href='#'">家电品牌转型高端市场 <span class="date">1周前</span></span>
            <span class="link" onclick="location.href='#'">挖野菜成户外社交新宠 专家提醒勿采野生 <span class="date">1周前</span></span>
            <span class="link" onclick="location.href='page-news3.html'">警方破获野外流动赌场 抓获60余人 <span class="date">15天前</span></span>
            <span class="link" onclick="location.href='#'">老城区道路整改提上日程 学校周边优先 <span class="date">3天前</span></span>
            <span class="link" onclick="location.href='#'">2027年义务教育阶段招生政策发布 <span class="date">5天前</span></span>
            <span class="link" onclick="location.href='#'">古镇"古风NPC互动"五一客流涨58% <span class="date">6天前</span></span>
            <span class="link" onclick="location.href='#'">大型购物中心开业 首日客流破10万 <span class="date">4天前</span></span>
            <span class="link" onclick="location.href='#'">"拒绝酒驾"专项行动启动 <span class="date">2天前</span></span>
        </div>
        <div class="copyright">
            <a href="#">关于万度</a> ｜
            <a href="#">用户协议</a> ｜
            <a href="#">隐私政策</a> ｜
            <a href="#">广告合作</a> ｜
            <a href="#">帮助中心</a> ｜
            青ICP备 20230001号 ｜
            ©2026 万度网络技术有限公司
        </div>
    </div>

    <!-- ============================================================
    8. 弹窗（不透露具体日期，只说"昨天"）
    ============================================================ -->
    <div class="modal-overlay" id="introModal">
        <div class="modal-box">
            <div class="icon">📩</div>
            <h2>委托信</h2>
            <div class="sub">发件人：匿名 · 加密渠道</div>
            <div class="letter">
                尊敬的侦探：<br><br>
                我的朋友昨天遭遇车祸离世。<br>
                官方通报称这是一起普通的醉驾事故。<br><br>
                但种种迹象表明，<strong>事情远没有这么简单</strong>。<br>
                恳请您深入调查，还原真相。
            </div>
            <button class="btn-start" onclick="closeModal()">接受委托</button>
        </div>
    </div>

    <!-- ============================================================
    9. JavaScript
    ============================================================ -->
    <script src="script.js"></script>
    <script>
        function closeModal() {
            document.getElementById('introModal').style.display = 'none';
        }

        function doSearch() {
            var kw = document.getElementById('searchInput').value.trim();
            if (!kw) {
                alert('请输入搜索关键词');
                return;
            }
            window.location.href = 'search.html?q=' + encodeURIComponent(kw);
        }

        document.addEventListener('DOMContentLoaded', function() {
            var input = document.getElementById('searchInput');
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') doSearch();
            });
            input.focus();
        });

        function hotSearch(word) {
            document.getElementById('searchInput').value = word;
            doSearch();
        }
    </script>
</body>
</html>
