-- CreateEnum
CREATE TYPE "ParkingType" AS ENUM ('public', 'private', 'courtesy');

-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('corporate', 'provider', 'visitor');

-- CreateTable
CREATE TABLE "Parking" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "spots" INTEGER NOT NULL,
    "parkingType" "ParkingType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Parking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CheckIn" (
    "id" TEXT NOT NULL,
    "parkingId" TEXT NOT NULL,
    "userType" "UserType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CheckIn_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Parking_name_key" ON "Parking"("name");

-- CreateIndex
CREATE INDEX "Parking_parkingType_idx" ON "Parking"("parkingType");

-- CreateIndex
CREATE INDEX "CheckIn_userType_idx" ON "CheckIn"("userType");

-- AddForeignKey
ALTER TABLE "CheckIn" ADD CONSTRAINT "CheckIn_parkingId_fkey" FOREIGN KEY ("parkingId") REFERENCES "Parking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
