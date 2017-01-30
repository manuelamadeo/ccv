.class Lcom/club_ciclista/valverdedejucar/MainActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/club_ciclista/valverdedejucar/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/club_ciclista/valverdedejucar/MainActivity;


# direct methods
.method constructor <init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$2;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$2;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method
