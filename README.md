# ReaderApp-iOS-Ananya

## Overview
ReaderApp-iOS-Ananya is a minimal iOS news reader app built programmatically.  
The app fetches news articles from a public API, displays the title, author, and thumbnail, supports **offline caching**, pull-to-refresh, and search functionality.  

## Features Implemented

1. **Fetch Articles**
   - Uses `URLSession` to fetch articles from a public API.
   - Displays **title**, **author**, and **thumbnail image** in a `UITableView`.

2. **Offline Caching**
   - Articles are cached locally using **Core Data** (`ArticleEntity`).
   - If offline, the app loads cached articles.
   
3. **Search Articles**
   - `UISearchBar` filters articles by title dynamically.

4. **Architecture**
   - **MVVM** separation: `NewsViewModel` handles API and filtering logic.
   - Views only display data, logic is separated.

5. **Programmatic UI**
   - No Storyboards used; all UI elements are created programmatically.
   - Adaptive layout supports **light and dark mode**.
