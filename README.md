# `2024.10.04`

## template-android

> `new project` 만들고 깃헙에 올리는게 조금 번거로워서 바로 만들 수 있게 만든 템플릿 프로젝트.  
> 깃헙에 new project를 쉽게 하는게 목적이라 Android Studio에서 `new project`때와 비슷한 수준까지만 업데이트 함.

## 구성 정보

* Android Studio Ladybug | 2024.2.1 Patch 1
* gradle version catalog
* Jetpack compose
* material3

| name       | version    |
|------------|------------|
| gradle     | 8.9        |
| AGP        | 8.7.1      |
| kotlin     | 2.0.21     |
| composeBom | 2024.10.00 |

나머지 버전정보는 여기 -> https://github.com/cgpathos/template-android/blob/main/gradle/libs.versions.toml

## 패키지 이름 변경하기

> https://github.com/android/architecture-templates/blob/base/customizer.sh 가져와서 적절하게 수정한 스크립트

```
 # {ApplicationName}은 공백없이 입력해야 함.
 ./sh/customizer.sh {your.package.name} [{ApplicationName}]
```
