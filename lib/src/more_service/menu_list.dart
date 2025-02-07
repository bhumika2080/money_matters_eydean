import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/more_service/model/menu_model.dart';

final moreServiceMenuList = [
  MenuCategoryModel(category: "Your Info Section", menus: [
    MenuModel(icon: Ionicons.briefcase, name: "Portfolio"),
    MenuModel(
        icon: Ionicons.eye,
        name: "Watchlist",
        route: AppRoute().watchlistScreen),
    MenuModel(icon: Ionicons.document, name: "My Notes"),
    MenuModel(icon: Ionicons.notifications, name: "Stock Alerts"),
    MenuModel(
        icon: Ionicons.happy,
        name: "IPO Result",
        route: AppRoute().webviewScreen,
        arguments: Constant().ipoResult),
    MenuModel(
        icon: Icons.handshake,
        name: "My Brokers",
        route: AppRoute().brokerListScreen),
  ]),
  MenuCategoryModel(category: "Premium Section", menus: [
    MenuModel(icon: Ionicons.grid, name: "Broker Analysis", slug: Slug.latest),
    MenuModel(
        icon: Ionicons.star, name: "Broker Favourites", slug: Slug.updated),
    MenuModel(
        icon: Ionicons.search, name: "Stockwise Analysis", slug: Slug.updated),
    MenuModel(
        icon: Ionicons.bar_chart, name: "Stocks By M.Cap", slug: Slug.latest),
    MenuModel(
        icon: Ionicons.flame, name: "Hot/Trending Stocks", slug: Slug.updated),
    MenuModel(
        icon: Ionicons.lock_open,
        name: "Promotor Share Unlock",
        slug: Slug.updated),
    MenuModel(
        icon: Ionicons.lock_open,
        name: "Mutual Fund Unlock",
        slug: Slug.latest),
    MenuModel(icon: Ionicons.medal, name: "Dividend Kings", slug: Slug.latest),
    MenuModel(icon: Ionicons.trending_up, name: "Advanced Charts"),
  ]),
  MenuCategoryModel(category: "NEPSE Section", menus: [
    MenuModel(icon: Ionicons.analytics, name: "Market Depth"),
    MenuModel(icon: Ionicons.briefcase, name: "Live Nepse"),
    MenuModel(
        icon: Ionicons.document_text,
        name: "Floorsheet",
        route: AppRoute().floorSheetScreen),
    MenuModel(
        icon: Ionicons.cash,
        name: "Stock Price",
        route: AppRoute().stockPriceScreen),
    MenuModel(
        icon: Ionicons.people,
        name: "Top Traders",
        route: AppRoute().topTradersScreen),
    MenuModel(
        icon: Ionicons.chevron_up,
        name: "Top Gainers",
        route: AppRoute().topGainerScreen),
    MenuModel(
        icon: Ionicons.chevron_down,
        name: "Top Losers",
        route: AppRoute().topLoserScreen),
    MenuModel(icon: Ionicons.pie_chart, name: "Market Indices"),
    MenuModel(
        icon: Ionicons.layers,
        name: "Stockwise Summary",
        route: AppRoute().sectorWiseSummaryScreen),
    MenuModel(
        icon: Ionicons.calendar,
        name: "Datewise Indices",
        route: AppRoute().dateWiseIndices),
    MenuModel(
        icon: Ionicons.calendar_number,
        name: "Datewise Market Cap.",
        route: AppRoute().datewiseMarketCapScreen),
    MenuModel(
        icon: Ionicons.calendar_outline,
        name: "Datewise Summary",
        route: AppRoute().datewiseMarketSummary),
    MenuModel(icon: Ionicons.thermometer, name: "52W High/Low"),
    MenuModel(icon: Ionicons.bar_chart, name: "Price/Volume Analysis"),
    MenuModel(icon: Ionicons.wallet, name: "Mutual Funds"),
    MenuModel(
        icon: Ionicons.swap_vertical,
        name: "Bulk Transactions",
        slug: Slug.latest),
    MenuModel(icon: Ionicons.list, name: "Listed Stocks"),
  ]),
  MenuCategoryModel(category: "News And Investment Section", menus: [
    MenuModel(icon: Ionicons.newspaper, name: "News"),
    MenuModel(
        icon: Ionicons.card, name: "Proposed Dividends", slug: Slug.updated),
    MenuModel(icon: Ionicons.logo_stackoverflow, name: "Upcoming Issues"),
    MenuModel(icon: Ionicons.layers, name: "Current Issues"),
    MenuModel(icon: Ionicons.calendar, name: "Events"),
    MenuModel(icon: Ionicons.document_attach, name: "Prospectus"),
    MenuModel(icon: Ionicons.trending_up, name: "IPO Pipeline"),
    MenuModel(icon: Ionicons.people_circle, name: "Broker List"),
  ]),
  MenuCategoryModel(category: "Stock Information Section", menus: [
    MenuModel(icon: Ionicons.information_circle, name: "Fundamentals"),
    MenuModel(icon: Ionicons.stats_chart, name: "Technical Chart"),
    MenuModel(icon: Ionicons.card, name: "Dividends"),
    MenuModel(icon: Ionicons.newspaper, name: "Stock News"),
    MenuModel(icon: Ionicons.document_text, name: "Financial Reports"),
    MenuModel(icon: Ionicons.megaphone, name: "Announcements"),
  ]),
  MenuCategoryModel(category: "Market Tools Section", menus: [
    MenuModel(icon: Ionicons.calculator, name: "Calculator"),
    MenuModel(icon: Ionicons.sync, name: "Compare Stocks"),
    MenuModel(icon: Ionicons.people, name: "Top Brokers", slug: Slug.updated),
    MenuModel(icon: Ionicons.time, name: "Reminders"),
    MenuModel(
        icon: Ionicons.open,
        name: "Meroshare",
        route: AppRoute().webviewScreen,
        arguments: Constant().meroshareLink),
  ]),
  MenuCategoryModel(category: "Other Information Section", menus: [
    MenuModel(
        icon: Ionicons.trending_up, name: "Inflation", slug: Slug.updated),
    MenuModel(icon: Ionicons.document_text, name: "NRB Indicators"),
    MenuModel(icon: Ionicons.sync, name: "Merger and Acquisition"),
    MenuModel(
        icon: Ionicons.cube, name: "Gold/Silver Rates", slug: Slug.latest),
    MenuModel(
        icon: Ionicons.cash,
        name: "Forex",
        slug: Slug.updated,
        route: AppRoute().forexScreen),
    MenuModel(icon: Ionicons.globe, name: "Global Markets"),
    MenuModel(icon: Ionicons.car, name: "Fuel Prices"),
  ]),
  MenuCategoryModel(category: "Share Hub Exclusive Section", menus: [
    MenuModel(icon: Ionicons.send, name: "Group Chat"),
    MenuModel(icon: Ionicons.logo_youtube, name: "Videos"),
    MenuModel(icon: Ionicons.school, name: "Education"),
    MenuModel(icon: Ionicons.bag, name: "Shop"),
    MenuModel(icon: Ionicons.radio, name: "Podcasts"),
    MenuModel(icon: Ionicons.chatbubbles, name: "Discussions"),
  ]),
];
