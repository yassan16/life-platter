# Architecture

本プロジェクトは DDD をベースとした 3 層構造を採用しています。

## レイヤー構造
- **Domain Layer**
  - Entity, ValueObject, Repository Interface
- **Application Layer**
  - UseCase, Service
- **Infrastructure Layer**
  - Repository 実装, API クライアント, DB

## データフロー
UI → Notifier → UseCase → Repository → API/DB
